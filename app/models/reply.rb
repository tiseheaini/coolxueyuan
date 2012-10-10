class Reply
  include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::CounterCache

	field :user_id,  :type => Integer
	field :topic_id, :type => Integer
	field :text,     :type => String

  belongs_to :topic
	counter_cache :name => :topic, :inverse_of => :topics
	belongs_to :user

  attr_accessible :text, :topic_id, :user_id
end
