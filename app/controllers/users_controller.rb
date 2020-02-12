class UsersController < ApplicationController


  def new; end

  
  def create
    user_params = params.require(:users).permit(:email, :password)
    @user = User.new(user_params)
    begin
      @user.save!
      session[:user] = @user
      redirect_to(posts_path, :notice => 'Congratulations You Have Signed Up to AceBook') 
    rescue => e
      if e.class == ActiveRecord::RecordInvalid
        redirect_to('/signup', :notice => 'Email already taken, please chose another')
      else
        redirect_to('/signup', :notice => "#{e}")
      end
    end
  end
end
