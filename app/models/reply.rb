class Reply < ActiveRecord::Base
  belongs_to :topic
	belongs_to :user

  attr_accessible :text, :topic_id, :user_id
end
