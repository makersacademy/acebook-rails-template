class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :this_user, only: [:show, :edit, :update, :destroy]

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    begin
      @user = User.create!(user_params)
    rescue => exception
      flash[:danger] = exception
      redirect_to new_user_url
    else
      flash[:success] = 'You have signed up!'
      redirect_to "/login"
    end
  end

  # GET /users/:id
  def show
    @courses = Course.joins("INNER JOIN users ON courses.user_id = users.id").select("users.username, courses.*").where(user_id: @user.id)
    #@subscriptions = Course.joins("INNER JOIN users ON users.id = courses.user_id INNER JOIN subscriptions ON courses.id = subscriptions.course_id").select("users.username", "courses.*").where("subscriptions.user_id = #{session[:user_id]}")
    subscribed_course_ids = User.find(params[:id]).subscriptions.pluck(:course_id)
    @subscriptions = Course.where(id: subscribed_course_ids)
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    begin
      @user.update!(user_params)
    rescue => exception
      flash[:danger] = exception
      redirect_back fallback_location: "/"
    else
      flash[:success] = 'User was successfully updated.'
      redirect_to user_url(@user)
    end
  end

  # DELETE /users/1
  def destroy
    begin
      @user.destroy!
    rescue => exception
      flash[:danger] = exception
      redirect_back fallback_location: "/"
    else
      flash[:success] = 'Account deleted!'
      redirect_to "/logout"
    end
  end

  private

  def this_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :avatar, avatar_attachment_attributes: [:id, :_destroy])
  end

end
