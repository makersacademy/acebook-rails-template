class PostsController < ApplicationController

  before_action :signed_in
  before_action :find_post, only: [:edit, :destroy, :show, :update, :upvote, :downvote]

  def new
    @post = current_user.posts.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to users_profile_url(id: @post.user_id) 
  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def index_by_user

  end

  def edit

  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  def show

  end

  def update
    if @post.update(post_params)
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  def upvote
    @post.upvote_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: posts_url }
      format.js { render layout:false }
    end
    # redirect_to posts_url
  end

  def downvote
    @post.downvote_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: posts_url }
      format.js { render layout:false }
    end
    # redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def signed_in
    redirect_to '/' if !user_signed_in?
  end

end
