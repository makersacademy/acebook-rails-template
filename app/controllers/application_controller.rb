class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper


  before_action :require_login

  private

  def require_login
    if current_user
      if current_user.id != params[:user_id].to_i
        p "hello params", params
        flash[:error] = "You can't post on to another person's account"
        redirect_to user_posts_url(current_user.id)
      end
    else
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end
