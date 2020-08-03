class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
    end

    def new
      ## Comment the following line out
       @user = User.new
    end

    def create
        # Users.create(params[:user][:email], params[:user][:password]
        # render plain: params[:user][:email].inspect
        @user = User.create(user_params)
        p @user
        p @user.save
        if @user.save ##this is a thing that returns true
          session[:user_id] = @user.id
          redirect_to '/welcome'
        else
          render 'new'
        end
    end

    private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
