class UsersController < Clearance::UsersController

  def create
    @user = user_from_params

    if params[:user][:password].length < 6 || params[:user][:password].length > 10
      flash[:alert] = "Password must be 6-10 characters!"
      redirect_to '/sign_up'
    elsif  @user.save
      sign_in @user
      redirect_to wall
    else
      render template: "users/new"
    end
   
  end

  def wall
    p user_from_params
  end



  private

  def user_params
    params.require(:user).permit(:first_name, :surname, :email, :password)
  end
end
