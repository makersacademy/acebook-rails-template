class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
 
  def authenticate
    command = AuthenticateUser.call(params[:user][:email], params[:user][:password])
 
    if command.success?
      render json: { 
        auth_token: command.result,
        user: User.find_by(email: params[:user][:email]),
        logged_in: true,
        status: :created
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
 end