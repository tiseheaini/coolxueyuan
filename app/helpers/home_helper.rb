module HomeHelper
  def node_ob
	  @node_ob = Node.order('topics_count DESC')
	end

	def message_mess_count
	  @message_mess_count = Message.find_by_receiveuser_and_read(session[:user_id], false).count
	end
end
