class UsersController < ApplicationController

  def show
    @user = params[:id]
    @posts = Post.all
    render 'posts/index'
  end

end
