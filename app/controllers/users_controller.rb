class UsersController < Clearance::UsersController
  def create
    @user = user_from_params

    if password_is_invalid?
      wrong_password_error
    elsif @user.save
      login_and_welcome
    else
      render template: 'users/new'
    end
  end

  private

  def user_from_params
  email = user_params.delete(:email)
  password = user_params.delete(:password)
  username = user_params.delete(:username)

  Clearance.configuration.user_model.new(user_params).tap do |user|
    user.email = email
    user.password = password
    user.username = username
  end
end

  def password_is_invalid?
    @user.password.length < 6 || @user.password.length > 10
  end

  def wrong_password_error
    flash[:notice] = 'Password must be between 6 - 10 characters'
    redirect_to sign_up_url
  end

  def login_and_welcome
    sign_in @user
    flash[:signed_up] = 'You are now registered to Acebook! Welcome!'
    redirect_back_or url_after_create
  end
end
