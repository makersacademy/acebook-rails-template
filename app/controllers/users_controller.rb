class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
    redirect_to(user_posts_path(user_id: session[:user_id]), notice: 'You cannot signup while logged in') if session[:user_id]
  end

  def create
    user_params = params.require(:user).permit(:email, :password, :profile_picture, :planet, :username, images: [])
    @user = User.new(user_params)
    begin
      @user.save!
      session[:user_id] = @user.id
      redirect_to(user_posts_path(user_id: @user.id), notice: "Congratulations #{@user['username']}, You Have Signed Up to wookiebook!")
    rescue ActiveRecord::RecordInvalid
      redirect_to('/signup', notice: @user.errors.messages.values[0].first)
    end
  end

  def image_form
    p "image form"
    p @user
  end

  def image
    user_params = params.require(:user).permit(:email, :password, :profile_picture, :planet, :username, images: [])
    @user = User.find(session[:user_id])
    begin 
      @user.update(user_params)
      p @user.attachments()
      p "look here"
      p @user.images
      redirect_to(user_posts_path(user_id: @user.id), notice: "Congratulations #{@user['username']}, You Have Successfully added images!")
    rescue ActiveRecord::RecordInvalid
      redirect_to('/signup', notice: @user.errors.messages.values[0].first)
    end
  end
end
