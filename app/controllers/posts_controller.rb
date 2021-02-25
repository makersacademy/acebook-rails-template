class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    redirect_to posts_url
    # respond_to do |format|
    #   if @post.save
    #     format.html { redirect_to @post, notice: 'Post was succesfully created' }
    #     format.json { render :show, status: :created, location: @post }
    #   else
    #     format.html { render :new}
    #     format.json { render json: @post.errors, status: :uprocessable_entity }
    #   end
    # end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
