# class UsersController < ApplicationController
#   def new
#     @user = User.new
#   end
#
#   def create
#     @user = User.create(post_params)
#     redirect_to users_url
#   end
#
#   def index
#     @users = User.all
#   end
#
#   private
#
#   def user_params
#     params.require(:user).permit(:email)
#   end
# end
