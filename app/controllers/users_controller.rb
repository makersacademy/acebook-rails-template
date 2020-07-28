class UsersController < ApplicationController

    def new
        
    end

    def create
        # Users.create(params[:user][:email], params[:user][:password]
        render plain: params[:user][:email].inspect
    end
end
