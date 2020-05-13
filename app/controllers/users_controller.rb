class UsersController < ApplicationController
  def new
  end

  def create
    User.create(user_params)
    redirect_to posts_path
  end

  def show
    p user.posts.find_by(user_id: logged_in_user.id)
    @posts = Post.all.find_by(user_id: logged_in_user.id)
  end 

  #@post.user = logged_in_user

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end