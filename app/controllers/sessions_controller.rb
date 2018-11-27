# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      json_response(user)
    else
      json_response(@user, 401)
      # flash.now[:danger] = 'Invalid email/password combination!'
      # render 'new'
    end
  end

  def destroy
    log_out
    json_response(message: "logged out")
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
