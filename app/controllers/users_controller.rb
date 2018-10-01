class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :edit]

  def show
    @posts = Post.where(user_id: params[:id]).order(created_at: :desc)
    @is_friend = Friendship.where(friend_id: params[:id], user_id: current_user.id)
    @is_friend2 =  Friendship.where(friend_id: current_user.id, user_id: params[:id])
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def edit
  end

  private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:profilepic)
    end
end
