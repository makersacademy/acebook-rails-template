class UsersController < ApplicationController


  def new; end

  
  def create
    user_params = params.require(:users).permit(:email, :password)
    @user = User.new(user_params)
    # begin
      @user.save!
      session[:user] = @user    
    #   redirect_to(posts_path, :notice => 'Congratulations You Have Signed Up to AceBook') 
    # rescue ActiveRecord::RecordInvalid => e
      
    #   redirect_to(new_users_path, :notice => 'NAH') 
    # end
      
    


  end


end
