class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.email)
    else
      render :index
    end
  end

  def show
    @comments = Comment.all
    id = params[:id]
    unless id.include? "@"
      @user = User.find(id)
      redirect_to user_path(@user.email)
    end
    check_current_wall
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :birthday,
      :password,
      :gender,
      :email
    )
  end

  def check_current_wall
    if current_user
      session[:current_wall] = request.original_url.split("/").pop
      @post = current_user.posts.build
      @posts = Post.all
    else
      redirect_to root_url, notice: "Please sign in"
    end

  end

end
