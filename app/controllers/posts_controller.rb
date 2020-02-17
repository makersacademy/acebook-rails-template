require 'time'
class PostsController < ApplicationController
  
  def new # action in the browser localhost:3000/posts/new
    @post = Post.new
  end

  def create # method to create a post
    @post = Post.create(post_params) # crud method
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_url # redirect to the posts page
  end

  def index # action - in the browser  localhost:30000/posts/index
    @posts = Post.all
  end

  def destroy # CRUD method to delete post
    @post = Post.find(params[:id]) # find the post by its id
    @post.destroy  # delete the id

    redirect_to posts_path # redirect to the posts page - localhost:3000/posts
  end

  def edit #action - localhost:3000/action
    @post = Post.find(params[:id]) # find/grab the post by its id
  end

  def update # CRUD method to update/edit a post
    @post = Post.find(params[:id])  # find /grab the method by its id

    if @post.update(params[:post].permit(:message))
      redirect_to posts_url # redirect to localhost:3000/posts
    else
      render 'edit' # render the edit.html.erb view
    end
  end

  private

  def post_params # helper linked to the create method - means that the post requires the text
    params.require(:post).permit(:message)
  end
end
