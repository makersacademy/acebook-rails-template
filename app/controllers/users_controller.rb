class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    params[:login_button] ? login : register
  end

  def index
    @user = User.new
  end

  def post_params
    params.require(:user).permit(:email, :password)
  end

  private
  def login
    begin
      @user = User.find_by(email: params[:user][:email])

      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to posts_url
      else
        flash[:returnMessage] = "Log in details not valid"
        redirect_to index
      end
    rescue Exception
      flash[:returnMessage] = "Serious - Logon database error"
      redirect_to index
    end
  end

  def register
    begin
      @user = User.create(post_params)
      flash[:returnMessage] = @user.errors.messages[:email][0] if @user.errors.messages[:email][0]
      flash[:returnMessage] = @user.errors.messages[:password][0] if @user.errors.messages[:password][0] 
      user_validation
    rescue ActiveRecord::RecordNotUnique
      flash[:returnMessage] = "User already exists"
      redirect_to new_user_path
    rescue Exception
      flash[:returnMessage] = "Something horrible happened"
      redirect_to new_user_path
    end
  end

  def user_validation
    if @user.valid?
      flash[:returnMessage] = "User successfully registered"
      session[:user_id] = @user.id
      redirect_to posts_url
    else
      redirect_to new_user_path
    end
  end
end
