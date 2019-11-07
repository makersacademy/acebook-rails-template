class UsersController < ApplicationController

  def show
    @user = params[:id]
    p @user
    @posts = Post.where(user_id: @user)
    render 'posts/index'
  end

end
