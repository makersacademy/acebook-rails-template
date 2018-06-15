class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_activities, only: [:index, :new, :edit]
  before_action :set_post, only: [:destroy, :edit, :update, :upvote, :downvote]

  def create
    @post = current_user.posts.create(post_params)
    redirect_back(fallback_location: root_path)
  end

  def index
    @post = current_user.posts.create
    @posts = Post.order(:id).reverse
    @post.create_activity :create, owner: current_user if @post.save
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    find_like_activity
    redirect_back(fallback_location: root_path)
  end

  def edit
    session[:prev_url] = request.referer
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to session[:prev_url], :notice => "Post has been updated"
    else
      render "edit"
    end
  end

  def upvote
    Post.public_activity_off
    if current_user.liked? @post
      Post.public_activity_on
      @post.create_activity(:unlike, owner: current_user)
      @post.unliked_by current_user
    else
      Post.public_activity_on
      @post.create_activity(:like, owner: current_user)
      @post.liked_by current_user
    end
    redirect_back(fallback_location: root_path)
  end

  def downvote
    Post.public_activity_off
    if current_user.disliked? @post
      Post.public_activity_on
      @post.create_activity(:undislike, owner: current_user)
      @post.undisliked_by current_user
    else
      Post.public_activity_on
      @post.create_activity(:dislike, owner: current_user)
      @post.disliked_by current_user
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message, :image)
  end

  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').limit(20)
  end

  def find_activity
    @activity = PublicActivity::Activity.find_by(trackable_id: params[:id])
  end

  def find_like_activity
    find_activity
    if @activity.present?
      @activity.destroy
      find_like_activity
    end
  end
end
