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
    if @user = User.find_by(email: params[:email])
      authenticate?
    else
      flash[:alert] = 'Sorry, we do not recognise this email address'
      render :new
    end
  end
end

  private

    def authenticate?
      if @user && @user.authenticate(params[:password])
        session[:current_user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:alert] = 'Sorry, please check your password and try again'
        render :new
      end
    end
