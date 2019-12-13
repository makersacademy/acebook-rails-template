class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in?
      redirect_to posts_path
    end 
  end
end
