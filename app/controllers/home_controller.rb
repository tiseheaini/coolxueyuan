# encoding: utf-8
class HomeController < ApplicationController
  skip_before_filter :validate_session
	caches_page :about_site, :contact

  def index
	  @topics = Topic.order("created_at DESC").limit(5)
  end
  
	def login
	  @user = User.authentication(params[:login], params[:password])
		if @user
		  session[:user_id] = @user.id
			redirect_to topics_path
	  else
		  flash[:notice] = '你的帐号或密码有问题，请重新输入'
			redirect_to new_login_path
	  end
  end

  def signout
	  session[:user_id] = nil
		redirect_to :back
	end

	def about_site
		
	end

	def contact
		
	end
end
