# encoding: utf-8
class Usermail < ActionMailer::Base
  default from: "承德医学院社区"

	def forget_password(user_name,user_qq)
	  @user_name = user_name
		@user_qq   = user_qq
		@user_hash = Forgetpassword.find_by_user_name(@user_name).password_forget_hash
		mail :to => "#{@user_qq}@qq.com", :subject => "#{@user_name}更改密码"
	end
end
