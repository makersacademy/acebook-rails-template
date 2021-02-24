class HomeController < ApplicationController
  skip_before_action :require_login
  def index
    if user_signed_in?
      redirect_to posts_path
    end
  end
end
