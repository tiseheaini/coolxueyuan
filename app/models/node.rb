class Node
  include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::CounterCache
 
  field :name,       :type => String
	field :topics_count, :default => 0

  attr_accessible :name

	has_many :topics, :validate => false, :dependent => :destroy
	has_many :users
end
