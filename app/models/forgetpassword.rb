class Forgetpassword < ActiveRecord::Base
  attr_accessible :password_forget_hash, :user_qq, :user_name, :read
end
