# -*- coding: utf-8 -*-

class SessionsController < ApplicationController
  def create
  	member = Member.authenticate(params[:name], params[:password])
  	if member
  	  session[:member_id] = member.id
  	  redirect_to :root
  	else
  	  flash.alert = "名前とパスワードが一致しません。"
  	  redirect_to params[:from]
  	end
  end

  def destroy
  	session.delete(:member_id)
  	redirect_to :root
  end
end
