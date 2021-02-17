class SubscribeController < ApplicationController
  before_action :find_course
  before_action :find_subscribe, only: [:destroy]

  def create
    if already_subscribed?
      flash[:warning] = "You can't subscribe more than once"
    else
      @course.subscribe.create(user_id: current_user.id)
    end
    redirect_back fallback_location: root_path #may need to change redirect
  end

  def destroy
    if !(already_subscribed?)
      flash[:warning] = "Cannot unsubscribe"
    else
      @subscribe.destroy
    end
    redirect_back fallback_location: root_path #may need to change redirect
  end

  private

  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_subscribe
    @subscribe = Subscribe.find(params[:id])
  end

  def already_subscribed?
    Subscribe.where(user_id: current_user.id, course_id: params[:course_id]).exists?
  end
end
