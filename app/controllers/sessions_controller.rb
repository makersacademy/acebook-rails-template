class SessionsController < ApplicationController
  before_action :authenticate_user, :only => [:home, :profile, :setting]
  before_action :save_login_state, :only => [:login, :login_attempt]

    def login
      #Login Form
    end
    
    def login_attempt
      p params
      user = User.find_by(username: params[:sessions][:username])
      if user && user.authenticate(params[:sessions][:password])
        flash[:notice] = "Wow Welcome again, you logged in as #{user.username}"
        session[:user_id] = user.id
        p user
        redirect_to('/posts/index')
      else
        flash[:notice] = "Invalid Username or Password"
        flash[:color]= "invalid"
        render "login"	
      end
    end

    def logout
      session[:user_id] = nil
      flash[:notice] = "Successfully logged out, fuck off"
      redirect_to :action => 'login'
    end

end
