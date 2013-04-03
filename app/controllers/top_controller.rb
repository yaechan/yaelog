class TopController < ApplicationController
  def index
  	@entries = Entry.readable_for(@current_member).order("posted_at DESC").paginate(page: params[:page], per_page: 1)
  end

  def about
  end
end
