# -*- coding: utf-8 -*-

class MembersController < ApplicationController
  before_filter :login_required, :except => ["show", "login"]

  def show
  	@member = Member.find_by_id(1)
  end

  def edit
  	@member = Member.find_by_id(1)
  end

  def update
  	@member = Member.find(1)
  	@member.assign_attributes(params[:member])
  	if @member.save
  	  redirect_to @member, notice: "更新しました。"
  	else
  	  render "edit"
  	end
  end

  def login
  end
end
