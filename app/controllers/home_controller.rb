# encoding: utf-8
class HomeController < ApplicationController
  def index
	  @topic = Topic.order("created_at DESC").limit(5)
		if session[:user_id]
		  @user = User.find(session[:user_id])
		end
  end
  
	def login
	  @user = User.authentication(params[:login], params[:password])
		if @user
		  session[:user_id] = @user.id
			redirect_to home_index_path
	  else
		  flash[:notice] = '你的帐号或密码有问题，请重新输入'
			redirect_to new_login_path
	  end
  end
end
