class SubscriptionsController < ApplicationController

  # POST /courses/:course_id/subscriptions
  def create
    begin
      Subscription.create!(subscription_params)
    rescue => exception
      flash[:warning] = exception
    else
      flash[:success] = "Added subscription!"
    ensure
      redirect_back fallback_location: "/"
    end
  end

  # DELETE /courses/:course_id/subscriptions/:id
  def destroy
    begin
      Subscription.find(params[:id]).destroy!
    rescue => exception
      flash[:warning] = exception
    else
      flash[:success] = "Removed subscription!"
    ensure
      redirect_back fallback_location: "/"
    end
  end

  private

  def subscription_params
    subscription_params = params.require(:subscription).permit(:course_id, :user_id)
    subscription_params[:user_id] ||= session[:user_id]
    subscription_params[:course_id] ||= params[:course_id]
    return subscription_params
  end

end
