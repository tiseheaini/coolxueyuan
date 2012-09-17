class Message < ActiveRecord::Base
  attr_accessible :read, :receiveuser, :receiveuser_delete, :senduser, :senduser_delete, :text
end
