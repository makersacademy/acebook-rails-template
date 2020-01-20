class UsersController < Clearance::UsersController

  def create
    @user = user_from_params

    if password_length_checker
      flash[:alert] = "Password must be 6-10 characters!"
      redirect_to '/sign_up'
    elsif @user.save
      sign_in @user
      redirect_to posts_path
    else
      render template: "users/new"
    end
   
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :surname, :email, :password)
  end
  
  def password_length_checker
    params[:user][:password].length < 6 || params[:user][:password].length > 10
  end

end
