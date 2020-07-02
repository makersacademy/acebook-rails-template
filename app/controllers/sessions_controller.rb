class SessionsController < ApplicationController
  def new
  end

  def create
    p params
    p user = User.find_by(email: params[:user][:email])
    # if user
    unless user.empty?
      redirect_to posts_url
    else
      puts "stop"
    end
  end
end
