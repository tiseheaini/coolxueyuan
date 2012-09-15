# encoding: utf-8
class UsersController < ApplicationController
  skip_before_filter :validate_session, :only => [:new, :create, :forget_password, :forget_password_create, :forget_password_change, :forget_password_to_change]
	before_filter      :forget_password_change_validate, :only => :forget_password_change

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

      if @user.save
			  session[:user_id] = @user.id
			  redirect_to home_index_path
      else
        render(:action => :new)
      end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
	def forget_password
	  @forget = Forgetpassword.new
	end

  def forget_password_create
	  if User.find_by_username_and_qq(params[:forget][:user_name],params[:forget][:user_qq])
  	  @forget = Forgetpassword.find_by_user_name(params[:forget][:user_name]) || Forgetpassword.new(:user_name => "#{params[:forget][:user_name]}")
			@forget.user_qq              = params[:forget][:user_qq]
	    @forget.password_forget_hash = Digest::SHA256.hexdigest(Array.new(30){rand(1024).to_s(36)}.join)

		  if @forget.save
			  Usermail.forget_password(params[:forget][:user_name],params[:forget][:user_qq]).deliver
		    flash[:user_mail] = params[:forget][:user_qq]
			  render :action => "forget_password"
		  else
        render :status => 404
		  end
		else
		  flash[:error] = "你给出的帐号和你在注册时的QQ不配对，无法给您发出邮件"
			render :action => "forget_password"
	  end
  end

	def forget_password_change
		
	end

	def forget_password_to_change
		@user = User.find_by_username(params[:user_name])
		if @user.update_attributes(params[:change])
			redirect_to home_index_path
	  else
		  redirect_to users_forget_password_change_path
		end
	end
	
	private

	  def forget_password_change_validate
		  @validate = Forgetpassword.find_by_user_name_and_password_forget_hash(params[:user_name],params[:user_hash])
	  	unless @validate
	  		redirect_to home_index_path
	  	end
	  end
end
