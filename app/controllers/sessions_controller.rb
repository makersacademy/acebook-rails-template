class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session][:password] == "pass"
      # Log the user in and redirect to the user's show page.
      redirect_to '/' and return
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
end
