class Api::V1::SessionsController < ApplicationController
    def create
       @user = User.find_by(email: params[:email])
       if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id 

         session[:user_id] = @user.id
          render json: {
            status: :created,
            user: @user,
            logged_in: true
          }
       else
        render json: {
            status: 401
          }
       end 
    end

    def destroy 
        session.clear
        render json: {
            status: 200,
            logged_in: false
        }
    end

end