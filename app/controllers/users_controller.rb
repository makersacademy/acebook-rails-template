class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    session[:recipient_id] = @user.id
    @posts = Post.where(recipient_id: @user.id).order('created_at DESC')
  rescue ActiveRecord::RecordNotFound
    redirect_to error_path
  end

end
