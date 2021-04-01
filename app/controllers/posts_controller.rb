class PostsController < ApplicationController
  respond_to :js, :html, :json

  def index
    @post = Post.new
    @user = current_user
    @posts = Post.order(created_at: :desc)
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_url
  end

  def edit
    @post = Post.find_by(id: params[:id])
    validate_edit
  end

  def update
    @post = Post.find_by(id: params[:id])
    if validate_edit == true # hopefully this will stop people from editing through an API POST request
      @post.update(message: params[:post])
      redirect_to posts_url
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])

    if current_user.id != @post.user_id
      # this will work, but refreshes the page and puts the message at the top
      redirect_to posts_url, notice: "Oops, that's not your post!"
      # # this could work, but needs to be extracted and drawn on the post
      # flash.now[:alert] = {post: params[:id], message: "Oops, that's not your post!"}
      # print("flash hash: "); puts(flash[:alert])

      # we could also skip this statement, by validating the from in JS
      # i.e. when the user logs in, we add their user id to the cookies,
      # we add the creater's id to post, and we have a javascript function
      # that checks the user_id === create_id when the button is clicked
      # https://stackoverflow.com/questions/29737384/accessing-current-user-variable-from-application-js-in-rails-3
    else
      @post.destroy
      redirect_to posts_url
    end
  end

  def like
    @post = Post.find_by(id: params[:id])
    if params[:format] == "like"
      @post.liked_by current_user
    elsif params[:format] == "unlike"
      @post.unliked_by current_user
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def validate_edit
    if current_user.id != @post.user_id
      redirect_to posts_url, notice: "Oops, that's not your post!"
      return false
    elsif @post.update_time_check == false
      redirect_to posts_url, notice: "Post is older than 10 minutes"
      return false
    else
      return true
    end
  end
end
