class HomePageController < ApplicationController

  def home

  end

  def afterlogin
    @users = User.all
  end

end
