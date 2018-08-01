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
    if valid_email? && valid_password?
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    elsif !valid_email?
      invalid_email_alert
    else
      invalid_password_alert
    end
  end

  private

    def valid_email?
      @user = User.find_by(email: params[:email])
    end

    def valid_password?
      @user && @user.authenticate(params[:password])
    end

    def invalid_password_alert
      flash[:alert] = 'Sorry, please check your password and try again'
      render :new
    end

    def invalid_email_alert
      flash[:alert] = 'Sorry, we do not recognise this email address'
      render :new
    end
end
