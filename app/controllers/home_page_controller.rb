class HomePageController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
  end
end
