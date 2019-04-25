class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(email: params[:user][:email_address])
    if user.valid?
      user.save
      session[:user_id] = user.id
      flash[:success] = "New account created"
      redirect_to posts_path
    else
    end
  end
end
