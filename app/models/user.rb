# encoding: utf-8
class User < ActiveRecord::Base
  has_many :topics

  attr_accessible :gender, :nickname, :password_hash, :password_salt, :qq, :schooldate, :username, :password, :password_confirmation

  attr_accessor :password_confirmation

  validates :username, :presence => {:message => "用户名不能为空"}
	validates :nickname, :presence => {:message => "昵称不能是空的"}
  validates :username, :uniqueness => {:message => "用户名已经有人注册过了"}
	validates :password, :confirmation => {:message => "两次输入的密码不一样"}

  def password
    @password
  end
  
  def password=(pass)
    return unless pass
    @password = pass
    generate_password(pass)
  end
  

  # 此处用动词形式(authenticate)更加合适, 特此说明一下. 感谢 Chen Kai 同学的提醒.
  def self.authentication(login, password)
    user = User.find_by_username(login)
    if user && Digest::SHA256.hexdigest(password + user.password_salt) == user.password_hash
      return user
    end
    false
  end
  
  private
  def generate_password(pass)
    salt = Array.new(10){rand(1024).to_s(36)}.join
    self.password_salt, self.password_hash = 
      salt, Digest::SHA256.hexdigest(pass + salt)
  end
end
