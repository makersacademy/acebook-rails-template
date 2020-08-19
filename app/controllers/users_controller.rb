class UsersController < ApplicationController

    skip_before_action :authorized, only: [:new, :create]

    def new
       @user = User.new
    end

    def create
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/' + current_user.id.to_s
      elsif @user.errors.messages[:name] != [] #bad name
        flash.now[:error] = "Name " + @user.errors.messages[:name].first
        render 'new'
      elsif @user.errors.messages[:email] != [] #bad email
        flash.now[:error] = "Seamail " + @user.errors.messages[:email].first
        render 'new'
      else
        flash.now[:error] = "Password in fincorrect format - please enter 6-10 characters"
        render 'new'
      end
    end

    private
    def user_params
      params.require(:user).permit(:email, :password, :name, :image)
    end
end
