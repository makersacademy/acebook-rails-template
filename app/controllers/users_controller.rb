class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new_user
  end

  def auth

    if User.exists?(email: params[:email])
      user = User.find_by email: params[:email]
      if params[:password] == user.password
        session[:current_user] = user.id
        redirect_to '/users'
      else
        flash[:notice] = "Wrong email or password, you silly fool!"
      redirect_to '/'
      end
    else
      flash[:notice] = "Wrong email or password, you silly fool!"
      redirect_to '/'
    end
   
    
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