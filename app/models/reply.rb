class Reply < ActiveRecord::Base
  belongs_to :topic, :counter_cache => true
	belongs_to :user

  attr_accessible :text, :topic_id, :user_id
end
