# encoding: utf-8
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "测试 username 不能为空" do
	  u = User.new

	  assert !u.valid?, "valid? 验证失败"
		assert u.errors[:username], "username 不为空"
		assert u.errors[:nickname], "nickname 不为空"
  end

	test "username 不能重复" do
    u = User.create(:username => '123456', 
	                  :nickname => 'nickname2', 
							      :password => '123456', 
							      :gender => '0', 
							      :qq => '844583686', 
							      :node_id => '2', 
							      :schooldate => '2012-08-27 10:34:50')

	  assert u.valid?, "valid? 没有通过"
		
		u_c = User.new(:username => "123456")
		assert !u_c.valid?, "u_c valid? 没有通过"
		assert u_c.errors[:username]
	end
end
