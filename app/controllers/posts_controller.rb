class PostsController < ApplicationController

  before_action :authenticate_user!
  respond_to :html, :xml, :json

  def new
    @recipient = params[:wallUserID]
    @user = User.find_by(id: params[:id])
    @user = current_user if @user.nil?
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to controller: 'users', action: 'show', id: params[:wallUserID]
  end

  def index
    @posts = Post.all.order('created_at DESC')
    respond_with(@posts)
  end

  def edit
    post
  end

  def show
    @posts = Post.all.order('created_at DESC')
    render 'index'
  end

  def destroy
    post.destroy
    redirect_to root_url
  end

  def update
    post.update_attributes(post_params)
    redirect_to controller: 'users', action: 'show', id: params[:wallUserID]
  end

  private

  def post
    @post ||= Post.find(params[:wallUserID])
  end

  def post_params
    params.require(:post).permit(:message, :recipient_id).merge(user_id: post.recipient_id)
  end
end
