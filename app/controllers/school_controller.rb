class SchoolController < ApplicationController
  def index
	  @school = Topic.all
  end

	# GET /topics/node:id
  def node
	  @node = Node.find(params[:id])
		@topic = @node.topics
	end
end
