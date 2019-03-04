class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    Post.create(user_id: current_user.id, message: params[:post][:message], image: params[:post][:image])
    redirect_to posts_url
  end

  def update
    @post.update(message: params[:post][:message])
    redirect_to posts_url
  end

  def index
    @posts_with_users = Post.left_outer_joins(:user)
                        .select('posts.*', 'users.first_name', 'users.last_name')
                        .order("created_at DESC")
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.fetch(:post, {})
    end
end
