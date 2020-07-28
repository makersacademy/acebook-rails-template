class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
    end

    def new

    end

    def create
        # Users.create(params[:user][:email], params[:user][:password]
        # render plain: params[:user][:email].inspect

        @user = User.new(user_params)

        @user.save
        redirect_to @user
    end

    private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
