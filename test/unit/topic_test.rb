# encoding: utf-8
require 'test_helper'

class TopicTest < ActiveSupport::TestCase
   test "topics 表测试验证" do
		 t = Topic.new
     assert !t.valid?
     assert t.errors[:title]
     assert t.errors[:text]
   end
end
