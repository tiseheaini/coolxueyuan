class Reply < ActiveRecord::Base
  attr_accessible :text, :topic_id, :user_id
end
