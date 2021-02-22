class RatingsController < ApplicationController
  before_action :this_rating, only: [:update, :destroy]
  
  # POST /courses/:course_id/ratings
  def create
    Rating.create(rating_params)
    redirect_back fallback_location: "/"
  end

  # PATCH/PUT /courses/:course_id/ratings/:id
  def update
    @rating.update(rating_params)
    redirect_back fallback_location: "/"
  end

  # DELETE /courses/:course_id/ratings/:id
  def destroy
  end

  private

  def this_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    rating_params = params.require(:rating).permit(:course_id, :user_id, :value)
    rating_params[:course_id] ||= params[:course_id]
    rating_params[:user_id] ||= session[:user_id]
    return rating_params
  end

end
