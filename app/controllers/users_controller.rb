class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new_user
  end

  def create_a_user
    user = User.create({
      name: params[:fullname],
      dob: params[:dob],
      cob: params[:cob],
      mob: params[:mob],
      email: params[:email],
      password: params[:password]
    })
    user.save
    redirect_to '/users'
    
  end

  def destroy_user
  end

  def update_user
    
  end

end