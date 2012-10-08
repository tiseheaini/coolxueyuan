class Message
  include Mongoid::Document
	include Mongoid::Timestamps

  field :senduser,        :type => String
	field :receiveuser,     :type => String
	field :text,            :type => String
	field :senduser_delete, :type => Boolean
	field :receiveuser_delete, :type => Boolean
	field :read, :type => Boolean
	
  attr_accessible :read, :receiveuser, :receiveuser_delete, :senduser, :senduser_delete, :text
end
