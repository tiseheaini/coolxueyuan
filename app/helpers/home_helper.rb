module HomeHelper
  def node_ob
	  @node_ob = Node.order('topics_count')
	end
end
