class SessionsController < ApplicationController
  def new
  end

  # def show
  #   session[:user_id] = nil
  #   redirect_to '/login'
  # end

  def create
    @user = User.find_by({ email: params[:user][:email] })
    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/posts' 
    # redirect_to "/wall/#{@user.name.downcase)}"
    else
      redirect_to '/login', notice: 'Invalid email/password combination'
    end
  end

  def destroy
    session.clear
    redirect_to '/login', notice: 'Logged out'
  end
end
