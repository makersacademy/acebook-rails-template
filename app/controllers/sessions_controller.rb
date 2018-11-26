# frozen_string_literal: true

# Sessions controller
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to "/#{user.id}"
    else
      flash.now[:danger] = 'Invalid login'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
