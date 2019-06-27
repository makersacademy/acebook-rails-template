class UsersController < ApplicationController
  layout 'iteratethroughposts', only: [:show]
  def new
  end

  def show
    if session[:user_id].nil?
      redirect_to root_url
    else
      @user = User.find(params[:id])
      @signed_in_user = User.find(session[:user_id])
      @wall = Wall.find_by(user_id: @user.id)
      @posts = Post.where("wall_id = #{@wall.id}").order(created_at: :desc)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      wall = Wall.create(user_id: @user.id)
      redirect_to users_path
    else
      if @user.password.length < 6 || @user.password.length > 10
        flash[:notice] = 'Password must be 6-10 characters'
      elsif @user.password != @user.password_confirmation
        flash[:notice] = 'Passwords do not match'
      elsif !@user.email.include?("@")
        flash[:notice] = 'Invalid email address'

      end
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
