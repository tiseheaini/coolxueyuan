# encoding: utf-8
class TopicsController < ApplicationController
  skip_before_filter :validate_session, :only => [:show, :index]

  # GET /index
  # GET /insex.json
  def index
	  @topics = Topic.all.paginate(:page => params[:page], :per_page=> 15)
	end

	# GET /user:id
	def user
		@topics = Topic.all
	end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.find_by(:id => params[:id])
		@reply = @topic[0].replies.asc(:created_at)
		@reply_new = Reply.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(params[:topic])
		@topic.user_id = session[:user_id]
		@topic.node_id = User.find(session[:user_id]).node_id

      if @topic.save
        redirect_to topics_path
      else
        render(:action => :new)
      end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
    	expire_fragment("home-topic-#{@topic.id}-#{@topic.updated_at.to_i}")
    	expire_fragment("topic-#{@topic.id}-#{@topic.updated_at.to_i}")
    	expire_fragment("topic#{@topic.id}-btn-reply")

			@topic.replies.each do |reply|
    	  expire_fragment("topic#{@topic.id}-reply#{reply.id}")
			end
    end

    respond_to do |format|
      format.html { redirect_to user_topics_url }
      format.json { head :no_content }
    end
  end
end
