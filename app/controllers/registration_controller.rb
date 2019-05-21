class RegistrationController < ApplicationController
  def sign_up
  end

  def new
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    @user.save()
  end
end
