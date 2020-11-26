class SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: [:new]
  before_action only: [:new, :create, :destroy]
  
  def new
    render json: { status: "It's working!" }
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def destroy
    @current_user = nil
    render json: { status: "Logged out!" }
  end
end
