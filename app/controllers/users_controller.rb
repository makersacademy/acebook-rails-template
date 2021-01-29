class UsersController < ApplicationController
    # wrap_parameters :user, include: [:name, :password, :password_confirmation]

    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_url, notice: "Thank You For Signing Up!"
        else
            render :new
        end
    end

private
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
