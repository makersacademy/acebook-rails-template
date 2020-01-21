class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    session[:recipient_id] = @user.id
    @posts = Post.where(recipient_id: @user.id).order('created_at DESC')
  rescue ActiveRecord::RecordNotFound
    redirect_to error_path
  end

  def index
    # this could be better!!!

    # get the list of users
    @users = User.all 
    # get this list of friend relations
    @friendships = Friendship.all
    # find friendship objects where user_id == current_user and convert objects array to array of friend id's
    user_friends = @friendships.select{|f| current_user.id == f.user_id }.map{|e| e.friend_id}
    # find users where they are not the current user and not already friends of the current user
    @users = @users.select{|u| user_friends.exclude?(u.id) && current_user.id != u.id }

  end  

end
