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
    id = params[:id]
    unless id.include? "@"
      @user = User.find(id)
      redirect_to user_path(@user.email)
      # if User.find(id)
      #   @user = User.find(id)
      #   redirect_to user_path(@user.email)
      # else
      #   redirect_to '/errors#not_found'
      # end
    end
    if current_user
      session[:current_wall] = request.original_url.split("/").pop
      @post = current_user.posts.build
      @posts = Post.all
    else
      redirect_to root_url, notice: "Please sign in"
    end
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

end
