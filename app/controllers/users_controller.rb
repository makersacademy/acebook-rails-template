class UsersController < Clearance::UsersController

  private

  def user_params
    params.require(:user).permit(:first_name, :surname, :email, :password)
  end
end