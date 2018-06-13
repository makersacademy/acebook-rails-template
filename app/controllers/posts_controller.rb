class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_activities, only: [:index, :new, :edit]

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
    find_activity
    @post.destroy
    if @activity.present?
      @activity.destroy
    end
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_url, :notice => "Post has been updated"
    else
      render "edit"
    end
  end
  private

  def post_params
    params.require(:post).permit(:message, :image)
  end

  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').limit(20)
  end

  def find_activity
    @activity = PublicActivity::Activity.find_by(trackable_id: params[:id])
  end
end
