class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            flash[:success] = "You are now signed in as #{user.name}"
            sign_in(user)
            redirect_to :root
        else
            flash.now[:error] = "WRONG"
            render 'new'
        end
    end

    def destroy
    end
end
