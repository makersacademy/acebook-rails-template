class Api::V1::RegistrationsController < ApplicationController
   
  def create
    begin
      user = User.create!(
        email: params["email"],
        first_name: params["first_name"],
        last_name: params["last_name"],
        password: params["password"]
      )
      if user 
        session[:user_id] = user.id
        render json: {
          status: :created,
          user: user
        }
      end
    rescue => exception
      render json: {
        status: 500
      }
    end  
  end
end
