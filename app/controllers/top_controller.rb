class TopController < ApplicationController
  def index
  	@entry = Entry.readable_for(@current_member).order("posted_at DESC").first
  end

  def about
  end
end
