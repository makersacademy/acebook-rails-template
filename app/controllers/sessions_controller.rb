class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      session[:id] = @user.id
      redirect_to '/posts'
    else
      flash.now[:danger] = 'Please check the information submitted'
      render 'new'
    end
  end

  def destroy
    session.delete(:id)
    @current_user = nil
    redirect_to '/'
  end

end
