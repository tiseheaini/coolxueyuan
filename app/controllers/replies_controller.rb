class RepliesController < ApplicationController
  def new
  end

  def create
	  @reply = Reply.new(params[:reply])
		@reply.user_id = session[:user_id]
		@reply.topic_id = params[:topic_id]

		if @reply.save
		  redirect_to :back
		else
		  redirect_to home_index_path
		end
  end
end
