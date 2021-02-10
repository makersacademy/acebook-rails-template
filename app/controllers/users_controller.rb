class UsersController < ApplicationController
  def new
   @user = User.new
   @profile = Profile.create
   @friendships = Friendship.new
 end

 def create
   @user = User.create(user_params)
 end

 def show
   @post = Post.new
   @user = User.find(params[:id])
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
