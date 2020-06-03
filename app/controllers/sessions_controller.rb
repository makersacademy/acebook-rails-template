class SessionsController < ApplicationController
  def new
    @user = User.last
  end

  def destroy
  end
end
