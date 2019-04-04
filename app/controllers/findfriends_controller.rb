class FindfriendsController < ApplicationController
  def index
    @users = Signup.where("username LIKE ?", "%#{params[:input]}%")
    render json: @users
  end
end
