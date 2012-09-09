# encoding: utf-8
class ApplicationController < ActionController::Base
  before_filter :validate_session
  protect_from_forgery

	private
	  def validate_session
		  unless session[:user_id]
			  flash[:notice] = "你还没有登录"
			  redirect_to new_login_path
			end
		end
end
