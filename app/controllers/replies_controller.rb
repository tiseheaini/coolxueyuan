# encoding: utf-8
class RepliesController < ApplicationController
  before_filter :validate_action

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

	private
	  def validate_action
		  unless session[:user_id]
			  flash[:notice] = "不能评论"
			  redirect_to :back
			end
		end
end
