class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
    render plain: params[:user].inspect
  end
end
