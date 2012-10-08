class Forgetpassword
  include Mongoid::Document
	include Mongoid::Timestamps

  field :user_name,           :type => String
	field :user_qq,             :type => String
	field :password_forget_hash,:type => String

  attr_accessible :password_forget_hash, :user_qq, :user_name, :read
end
