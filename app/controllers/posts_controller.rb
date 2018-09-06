# frozen_string_literal: true

# Add this line in every controller where we wish to restrict view to only signed in users
# before_filter :authorize

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @post.save
        @post.postimage = params[:post][:postimage]
        @post.save!
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @posts = Post.order(created_at: :desc).all
    @users = User.all
  end

  def show
    set_post
    @comments = @post.comments.all
    @comment = @post.comments.build
  end

  def upvote
    :verify_authenticity_token
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  def downvote
    :verify_authenticity_token
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  private

  def set_post
    @post = Post.find(params[:id])
   
  end

  def post_params
    params.require(:post).permit(:postimage, :message)
  end
end
