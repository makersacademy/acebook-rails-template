class RegistrationController < ApplicationController
  def signup
  end

  def new
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    @user.save()
    redirect_to :action => "index"
  end

  def index
    @users = User.all
  end 
end
