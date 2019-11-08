class UsersController < ApplicationController
  
  before_action :authenticate_user!, only: [:profile]

  def profile
    if params[:id]
      @user = User.find(params[:id])
    elsif params[:username]
      @user = User.where(username: params[:username]).first
    end
    @posts = Post.where(user_id: params[:id]).order("created_at DESC")
  end

  
  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def new

  end

  def create
    @user = User.new(user_params)
    p @user
    p user_params
    @user.save!
    p @user.avatarImage.url
    # respond_to do |format|
    #   if @user.save
    #     format.html do
    #       redirect_to @user
    #     end
    #   format.json {render json: @reservation.to_json}
    # else
    #   format.html {render 'new'}
    #   format.json {render kson:@user.errors}
    # end
  #end
  end

  private

  def user_params
    params.require(:user).permit(:avatarImage, :username, :first_name, :last_name, :password, :email)
  end
end
