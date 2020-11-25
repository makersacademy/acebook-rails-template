class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  include CurrentUserConcern

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by(id: params['id'])
    @user_posts = Post.find_by(user_id: params['id'])

    render json: {
      user: @user,
      user_posts: @user_posts,
      comments: @user_posts.comments,
      likes: @user_posts.likes
    }
  end

  # POST /users
  # POST /users.json
  def create
    if user_already_exists 
      render json: { status: "user already exists" }
    else
      @user = User.new(user_params)

      if @user.save
        session[:user] = @user
        render json: { status: :created, user: @user }
      else
        render json: { status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render json: { status: :ok, user: @user }
    else
      render json: { status: :unprocessable_entity }
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    render json: { status: :user_destroyed }
  end

  private

    def user_already_exists
      User.find_by(email: params[:email])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

