class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.animal = params[:user][:animal]
    @user.age = params[:user][:age]
    @user.owner = params[:user][:owner]
    @user.save
    redirect_to :action => "show", :id => current_user.id
  end

  def edit
    @user = User.find(params[:id])
  end

end
