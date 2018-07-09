class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(
      :animal => params[:user][:animal],
      :age => params[:user][:age],
      :owner => params[:user][:owner]
    )
    redirect_to :action => "show", :id => current_user.id
  end

  def edit
    @user = User.find(params[:id])
  end

end
