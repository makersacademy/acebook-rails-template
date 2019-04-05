class FindfriendsController < ApplicationController
  def index
    username = Signup.arel_table[:username]
    @users = Signup.where(username.matches("%#{params[:input]}%")).to_a
    p @users
    render json: @users
  end
end
