# encoding: utf-8
class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.where(:receiveuser => session[:user_id]).paginate(:page => params[:page] , :per_page => 15)
		@messages.each do |m|
		  m.read = true
			m.save
		end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new
		@receive_name = User.find(params[:receive_id]).nickname
		flash[:receive_id] = params[:receive_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
		@message.senduser = session[:user_id]
		@message.receiveuser = flash[:receive_id]

      if @message.save
        redirect_to home_index_path 
      else
        render :action => "new"
      end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
