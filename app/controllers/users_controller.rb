class UsersController < ApplicationController
  def new
  end

  def create 
    render plain: params[:users].inspect
  end

end
