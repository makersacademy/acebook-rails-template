# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  skip_before_action :authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(article_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Acebook #{@user.email}"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def destroy
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    if @post.user_id == session[:user_id]
      @post.destroy
      redirect_to user_path(current_user)
    else
      delete_alert(@user)
    end
  end

  private

  def article_params
    params.require(:user).permit(:email, :password)
  end

  def delete_alert(user)
    flash.now.alert = 'Apologies, this is not your post to delete!'
    @posts = user.posts.order(created_at: :desc)
    render 'show'
  end
end
