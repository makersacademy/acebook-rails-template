class UsersController < ApplicationController
  def new
    @user = User.new
    @profile = Profile.create
    @friendships = Friendship.new
  end

  def create
    @user = User.create(user_params)
    UserMailer.with(user: @user).welcome_email.deliver_now
    format.html { redirect_to(@user, notice: "User was created.") }
    format.json { render json: @user, status: :created, location: @user }
  end

  def show
    @post = Post.new
    @user = User.find(params[:id])
    @posts = Post.all
    @comment = Comment.new(post_id: params[:post_id])
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = Post.all
    @comment = Comment.new(post_id: params[:post_id])
  end

  def index
    @users = User.all
    @friendships = Friendship.all
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :bio, :avatar)
  end
end
