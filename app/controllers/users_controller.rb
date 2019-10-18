class UsersController < Clearance::UsersController
  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to posts_url
  end

  private

  def user_params
   params.require(:user).permit(
      :email,
      :password,
      :firstname,
      :surname,
      :birthday,
      :gender,
      :profile_picture
    )
  end
end
