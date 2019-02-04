class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      puts "here"
      redirect_to user
    else
    flash.now[:danger] = "Invalid details you cretin"
    puts "incorrect"
    render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
