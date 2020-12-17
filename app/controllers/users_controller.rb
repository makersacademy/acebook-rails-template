class UsersController < ApplicationController
  def new
    render 'new'
  end

  def create
    if User.find_by(username: params[:username])
      redirect_to '/signup', notice: 'Username taken, please choose a different username'
      return
    end

    if User.find_by(email: params[:email])
      redirect_to '/signup', notice: 'Email already registered'
      return
    end

    if params[:password] != params[:password_confirmation]
      redirect_to '/signup', notice: 'Password does not match confirmation'
      return
    end

    user = User.create(
      username: params['username'],
      email: params['email'],
      password: params['password'],
      password_confirmation: params['password_confirmation'],
      profile_picture: params['profile_picture']
    )

    if user
      redirect_to '/posts'
    else
      redirect_to '/signup'
    end
  end
end