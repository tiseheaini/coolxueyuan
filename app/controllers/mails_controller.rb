# encoding: utf-8
class MailsController < ApplicationController
  # GET /mails
  # GET /mails.json
  def index
    @mails = Mail.find_all_by_receiveuser(session[:user_id])
		@mails.each do |m|
		  m.read = true
			m.save
		end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mails }
    end
  end

  # GET /mails/new
  # GET /mails/new.json
  def new
    @mail = Mail.new
		@receive_name = User.find(params[:receive_id]).nickname
		flash[:receive_id] = params[:receive_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mail }
    end
  end

  # POST /mails
  # POST /mails.json
  def create
    @mail = Mail.new(params[:mail])
		@mail.senduser = session[:user_id]
		@mail.receiveuser = flash[:receive_id]

      if @mail.save
        redirect_to home_index_path 
      else
        render :action => "new"
      end
  end


  # DELETE /mails/1
  # DELETE /mails/1.json
  def destroy
    @mail = Mail.find(params[:id])
    @mail.destroy

    respond_to do |format|
      format.html { redirect_to mails_url }
      format.json { head :no_content }
    end
  end
end
