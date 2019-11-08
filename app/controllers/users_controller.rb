class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.save

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to "/users/#{session[:user_id]}"
      flash.notice = "You have successfully signed up #{@user.username}"
    else @user.invalid?
      signup_error = @user.errors.messages.first.flatten.join(" ")
      redirect_to '/signup', alert: signup_error
    end

  end

  def show
    user_not_signed_in
    @user = User.find_by(id: params[:id])
    @post = Post.new
    @posts = Post.all
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(update_params)
      redirect_to "/users/#{@user.id}"
    else
      Rails.logger.info(@user.errors.messages.inspect)
      render :action => 'edit'
    end
    # p "--------------------------"
    # p @user
    # @user.update(update_params)
    # p "***************************"
    # p @user.update(update_params)
    # p "$$$$$$$$$$$$$$$$$$$$$$$$$$"
    # p update_params
    # redirect_to "/users/#{@user.id}"
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :full_name, :lizard_species, :birthday, :profile_picture)
  end

  def update_params
    params.require(:user).permit(:font_family, :background_colour)
  end
end
