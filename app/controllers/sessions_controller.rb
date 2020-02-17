# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login
  skip_before_action :authenticated_user, only: :destroy
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome back #{@user.email}"
      redirect_to @user
    else
      flash.now.alert = 'Incorrect email or password'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to home_path
  end

  def create_oauth
    auth = request.env['omniauth.auth']
    @user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
    session[:user_id] = @user.id
    flash[:notice] = "Welcome back #{@user.email}"
    redirect_to @user
  end
end
