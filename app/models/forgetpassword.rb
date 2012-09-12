class Forgetpassword < ActiveRecord::Base
  attr_accessible :password_forget_hash, :user
end
