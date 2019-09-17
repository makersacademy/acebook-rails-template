class UsersController < Clearance::UsersController

  def create
    @user = user_from_params

    # password validation:
    if @user.password.length < 6 || @user.password.length > 10
      flash[:notice] = "Password must be between 6 - 10 characters"
      redirect_to sign_up_url
      return
    end

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end



end
