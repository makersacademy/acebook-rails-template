class SessionController < ApplicationController
  # the verification of authenticity_token prevents CSRF
  # commented out, as we don't need to skip this but useful to know how to skip
  # use the following code below
  # skip_before_action :verify_authenticity_token, only: [:create]

  #GET /session/new
  def new
  end

  #POST /session
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      # p @user.id
      redirect_to user_path(@user)
    end

  end

end
