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
    @all_courses = Course.with_attached_main_image.find_by_sql("
      SELECT
        users.username,
        courses.*
      FROM (
          SELECT
            courses.*,
            AVG(coalesce(ratings.value, 0)) AS rating,
            bool_or( EXISTS (SELECT id FROM subscriptions WHERE subscriptions.course_id = courses.id AND subscriptions.user_id = #{params[:id]})) as is_subbed
          FROM
            courses
          FULL JOIN ratings ON courses.id = ratings.course_id
          GROUP BY
          courses.id) 
        AS courses
        JOIN users ON users.id = courses.user_id
        WHERE user_id = #{params[:id]}
        OR is_subbed = true;")
        # returns all courses, their ratings, the user that created them, and whether the user is subscribed to them
  end

  # GET /users/:id/edit
  def edit
  end

  # PATCH/PUT /users/:id
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

  # DELETE /users/:id
  def destroy
    if params[:delete_avatar]
      @user.avatar.purge
      flash[:success] = 'Profile picture deleted!'
      redirect_to user_url(@user)
    else
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
  end

  private

  def this_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :avatar)
  end

end
