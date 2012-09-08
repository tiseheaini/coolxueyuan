class Mail < ActiveRecord::Base
  attr_accessible :receiveuser, :receiveuser_delete, :senduser, :senduser_delete, :text
end
