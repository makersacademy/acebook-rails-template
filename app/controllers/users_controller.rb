class UsersController < ApplicationController
  def index
    render 'users/index'
  end

  def create
    user = User.create(
      username: params['username'],
      email: params['email'],
      password: params['password'],
      password_confirmation: params['password_confirmation'],
      profile_picture: params['profile_picture'],
      bio: params['bio']
    ) 
  end
end