class Reply < ActiveRecord::Base
  belongs_to :topics

  attr_accessible :text, :topic_id, :user_id
end
