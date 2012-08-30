# encoding: utf-8
class Topic < ActiveRecord::Base
  belongs_to :user
	belongs_to :node, :counter_cache => true
	has_many :replies

  attr_accessible :node_id, :text, :title, :user_id

  validates :text, :presence => {:message => "你的文章怎么能是空的呢？"}
end
