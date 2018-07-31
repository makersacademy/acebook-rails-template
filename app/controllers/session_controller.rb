class SessionController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:create]

  #GET /session/new
  def new
  end

  #POST /session
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_url
    end
  end
end
