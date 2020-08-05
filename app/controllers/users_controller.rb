class UsersController < ApplicationController

    skip_before_action :authorized, only: [:new, :create]

    # def show
    #   @user = User.find(params[:id])
    # end

    def new
       @user = User.new
    end

    def create
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/' + current_user.id.to_s
      elsif @user.errors.messages[:email] != [] #bad email
        flash.now[:error] = "Email in fincorrect format"
        render 'new'
      else  #bad password
        flash.now[:error] = "Password in fincorrect format - please enter 6-10 characters"
        render 'new'
      end
    end

    private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end


#<ActiveModel::Errors:0x00007ff34e9dc940 
# @base=#<User id: nil, email: "dsdas", password_digest: "$2a$12$KOlJPc.IcS5a72H3/eYoJeOXkgHlpeXPjGhyQUov9M5...", created_at: nil, updated_at: nil>, 
# @messages={:email=>["is invalid"]}, 
# @details={:email=>[{:error=>:invalid, :value=>"dsdas"}]}>