class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :this_user, only: [:edit, :update, :destroy]

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User was successfully created.'
      redirect_to "/login"
    else
      redirect_to new_user_url
    end
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    @courses = Course.joins("INNER JOIN users ON courses.user_id = users.id").select("users.username, courses.*").where(user_id: @user.id)
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      flash[:success] = 'User was successfully updated.'
    end
    redirect_back fallback_location: "/"
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @user.destroy
      flash[:success] = 'User was successfully destroyed.'
    end
    redirect_back fallback_location: "/"
  end

  private

  def this_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
