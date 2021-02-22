class RatingsController < ApplicationController
  before_action :this_post, only: [:update, :destroy]
  before_action :this_course
  
  # POST /courses/:course_id/ratings
  def create
    Rating.create(rating_params)
    redirect_back fallback_location: "/"
  end

  # PATCH/PUT /courses/:course_id/ratings/:id
  def update
  end

  # DELETE /courses/:course_id/ratings/:id
  def destroy
  end

  private

  def this_rating
    @rating = Rating.find(params[:id])
  end

  def this_course
    @course = Course.find(params[:course_id])
  end

  def rating_params
    rating_params = params.require(:rating).permit(:course_id, :user_id, :value)
    rating_params[:course_id] ||= params[:course_id]
    rating_params[:user_id] ||= session[:user_id]
    return rating_params
  end

end
