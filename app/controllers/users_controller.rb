class UsersController < ApplicationController

    skip_before_action :authorized, only: [:new, :create]

    def show
      @user = User.find(params[:id])
    end

    def new
      ## Comment the following line out
       @user = User.new
    end

    def create
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/posts'
      else
        flash[:error] = "Email or password in incorrect format"
        render 'new'
      end
    end

    private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
