# frozen_string_literal: true

class PostsController < ApplicationController
skip_before_action :require_login, only: [:index]

  def new
    @post = Post.new
    @posts = Post.where({user: current_user}).order('created_at DESC')
  end

  def create
    @post = Post.create!(post_params.merge({user_id: current_user.id}))
    json_response(@post)
  end

  def index
    @chat = Chat.new
    @chats = Chat.all
    @posts = Post.order('created_at DESC')
    json_response(@posts)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user.id == current_user.id
      @post.destroy
      json_response(nil, 200)
    else
      json_response(@post, 401)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.editable? && @post.user.id == current_user.id
      @post.update(message: params[:post][:message])
      json_response(@post)
    else
      json_response(@post, 401)
    end
  end

  def like
    @likeable = Post.find(params[:id])
    like = Like.find_by({likeable: @likeable, user: current_user})
    if like
      like.destroy
      flash = "Like Removed!"
    else
      Like.create(likeable: Post.find(params[:id]), user: current_user)
      flash = "Like Counted!"
    end
    respond_to do |format|
      format.html do
        flash[:danger] = flash
        redirect_to posts_url
      end
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
