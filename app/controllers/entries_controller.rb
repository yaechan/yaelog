# -*- coding: utf-8 -*-

class EntriesController < ApplicationController
  before_filter :login_required, :except => ["index", "show", "group", "search", "archives"]

  def index
    @entries = Entry.readable_for(@current_member).order("posted_at DESC").paginate(page: params[:page], per_page: 5)
  end

  def show
    @entry = Entry.readable_for(@current_member).find(params[:id])
  end

  def new
    @entry = Entry.new(posted_at: Time.current)
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(params[:entry])
    @entry.author = @current_member
    if params[:select_category].present?
      @entry.category = params[:select_category]
    elsif params[:text_category].present?
      @entry.category = params[:text_category]
    end
    if @entry.save
  	  redirect_to @entry, notice: "記事を作成しました。"
    else
  	  render "new"
    end
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.assign_attributes(params[:entry])
    if params[:select_category].present?
      @entry.category = params[:select_category]
    elsif params[:text_category].present?
      @entry.category = params[:text_category]
    end
    if @entry.save
  	  redirect_to @entry, notice: "記事を更新しました。"
    else
  	  render "edit"
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to :root, notice: "記事を削除しました。"
  end

  def group
    @para = params[:para]
    @groups = Entry.readable_for(@current_member).order("posted_at DESC").where(:category => params[:para]).paginate(page: params[:page], per_page: 5)
  end

  def search
    @entries = Entry.readable_for(@current_member).order("posted_at DESC").search(params[:search_text]).paginate(page: params[:page], per_page: 5)
    render "index"
  end

  def archives
    @entries = Entry.readable_for(@current_member).order("posted_at DESC").where(:id => params[:id]).paginate(page: params[:page], per_page: 5)
    render "index"
  end
end