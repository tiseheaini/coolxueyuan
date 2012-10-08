# encoding: utf-8
class Topic
  include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::CounterCache

	field :user_id, :type => Integer
	field :node_id, :type => Integer
	field :title,   :type => String
	field :text,    :type => String
	field :replies_counts, :type => Integer, :default => 0

  belongs_to :user
	belongs_to :node
	counter_cache :name => :node, :inverse_of => :topics
	has_many :replies

  attr_accessible :node_id, :text, :title, :user_id

  validates :text, :presence => {:message => "你的文章怎么能是空的呢？"}
end
