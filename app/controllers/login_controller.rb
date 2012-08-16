# encoding: utf-8
class LoginController < ApplicationController
  def new
	  @user = User.new
  end

  def create
	  @user = User.authentication(params[:login], params[:password])
		if @user
		  session[:user_id] = @user.id
			redirect_to home_index_path
	  else
		  flash[:notice] = '你的帐号或密码有问题，请重新输入'
		  render(:action => :new)
	  end
  end
end
