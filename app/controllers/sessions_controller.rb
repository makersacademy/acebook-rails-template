class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            flash[:success] = "You are now signed in as #{user.name}"
            sign_in(user)
            redirect_to :root
        elsif !user
            flash.now[:error] = "We can't find your info on our records - please try again."
            render 'new'
        else
            flash.now[:error] = "Wrong password!"
            render 'new'
        end
    end

    def destroy
        sign_out
        redirect_to :root
    end
end
