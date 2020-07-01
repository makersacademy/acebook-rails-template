class WelcomeController < ApplicationController
  def index
  end

  def sign_up
    @user = new.User
  end

  def login
  end

  def logout
  end
end
