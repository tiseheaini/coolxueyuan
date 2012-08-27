class Node < ActiveRecord::Base
  attr_accessible :name

	has_many :topics
	has_many :users
end
