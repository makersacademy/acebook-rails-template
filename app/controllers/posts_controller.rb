class PostsController < ApplicationController
  # respond_to :js, :html, :json
  
  def new
    @post = Post.new
    # respond_to do |format|
    #   if @post.save
    #     format.html { redirect post_path(@post) }
    #     format.json { render json: @post.to_json }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @post.errors.to_json }
    #   end
    # end
    # # @post.save
  end

  def create
    @post = Post.create(message: post_params, user_id: session[:current_user_id])
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def yours
    @posts = Post.where user_id: session[:current_user_id]
  end

  def like
    @post = Post.find(params[:id])
    @post.liked_by User.find_by(id: session[:current_user_id])
  end

  def unlike
    @post = Post.find(params[:id])
    @post.unliked_by User.find_by(id: session[:current_user_id])
  end

  def show
    @comments = Comment.all
    @comments.order! 'created_at DESC'
    @post = Post.find(params[:id])
    session[:current_post_view] = @post.id
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:message)
    message = params[:post][:message]
    return message
  end

end
