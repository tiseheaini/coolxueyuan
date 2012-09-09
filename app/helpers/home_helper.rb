module HomeHelper
  def node_ob
	  @node_ob = Node.order('topics_count DESC')
	end

	def mail_mess_count
	  @mail_mess_count = Mail.find_all_by_receiveuser(session[:user_id]).count
	end
end
