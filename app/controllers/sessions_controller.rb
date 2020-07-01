class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by (:email params["user"]["email"])
    .try(:authenticate, params["user"]["password"])
    if user 
      session[:user_id] = user.id 
      redirect_to :action => post_path, :id => user.id, notice: "You successfully logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
  end
end
