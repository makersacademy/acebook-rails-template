class UsersController < Clearance::UsersController
  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      flash[:signed_up] = 'You are now registered to Acebook! Welcome!'
      redirect_back_or url_after_create
    else
      render template: 'users/new'
    end
  end
end
