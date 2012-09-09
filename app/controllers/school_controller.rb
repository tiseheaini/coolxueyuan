class SchoolController < ApplicationController
  skip_before_filter :validate_session
	# GET /topics/node:id
  def node
	  @node = Node.find(params[:id])
		@topics = @node.topics
	end
end
