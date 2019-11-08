class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params(@@wall_id))
    redirect_to "/#{@post.wall_id}"
  end

  def index
    @@wall_id = params[:id]
    @posts = Post.where(wall_id: params[:id]).reverse
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(edit_params)
      redirect_to "/#{@post.wall_id}"
    else
      render 'edit'
    end
  end

  def destroy
    wall_id = params.require(:post).permit(:receiver)[:receiver]
    Post.destroy(params[:id])
    redirect_to "/#{wall_id}"
  end

  private

  def post_params(wall_id)
    params.require(:post).permit(:message).merge(user_id: current_user.id, wall_id: wall_id )
  end

  def edit_params
    params.require(:post).permit(:message)
  end

end
