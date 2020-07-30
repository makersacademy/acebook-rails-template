class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
    end

    def new
      ## Comment the following line out
       @user = User.new
      p "within new method in the controller"

    end

    def create
        # Users.create(params[:user][:email], params[:user][:password]
        # render plain: params[:user][:email].inspect
        p "within create method in controller"
        @user = User.new(user_params)
        if @user.save
          redirect_to @user
        else
          render 'new'
        end
    end

    private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
