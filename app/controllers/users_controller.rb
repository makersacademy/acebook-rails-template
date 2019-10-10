class UsersController < ApplicationController

  def new
    p @user = User.new
  end

  def create
    if params[:login_button]
      p "here"
      p params[:user][:email]
      p @user = User.find_by(email: params[:user][:email])
      p session[:user_id] = @user.id
      redirect_to posts_url
      # if BCrypt::Password.new(@user.password) == params['password']
      #   redirect '/spaces'
      # else flash[:notice] = "Credentials Incorrect"
      #   redirect '/login'
      # end
    else

      begin
        p @user = User.create(post_params)
        if @user.errors.messages[:email][0]
          flash[:returnMessage] = @user.errors.messages[:email][0]
        end

        if @user.errors.messages[:password][0]
          flash[:returnMessage] = @user.errors.messages[:password][0]
        end

        if @user.valid?
          flash[:returnMessage] = "User successfully registered"
          redirect_to posts_url
        else
          redirect_to new_user_path
        end

      rescue ActiveRecord::RecordNotUnique
        flash[:returnMessage] = "User already exists"
        redirect_to new_user_path
      rescue Exception
        flash[:returnMessage] = "Something horrible happened"
        redirect_to new_user_path
      end
    end
  end

  def index
    @user = User.new
  end

  def post_params
    params.require(:user).permit(:email, :password)
  end
end
