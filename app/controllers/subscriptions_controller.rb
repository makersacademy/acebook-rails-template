class SubscriptionsController < ApplicationController

  # POST /courses/:course_id/subscriptions
  def create
    begin
      Subscription.create!(subscription_params)
    rescue => exception
      flash[:danger] = exception
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
      flash[:danger] = exception
    else
      flash[:success] = "Removed subscription!"
    ensure
      redirect_back fallback_location: "/"
    end
  end

  private

  def subscription_params
    { user_id: session[:user_id], course_id: params[:course_id] }
  end

end
