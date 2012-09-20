# encoding: utf-8
class LoginController < ApplicationController
  skip_before_filter :validate_session

  def new
	  @user = User.new
  end

  def create
	  @user = User.authentication(params[:login], params[:password])
		if @user
		  session[:user_id] = @user.id
			redirect_to topics_path
	  else
		  flash[:notice] = '你的帐号或密码有问题，请重新输入'
		  render(:action => :new)
	  end
  end
end
