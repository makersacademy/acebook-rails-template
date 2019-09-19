class UsersController < Clearance::UsersController
  def create
    @user = user_from_params

    if invalid_login_details
    elsif @user.save
      @user.create_wall!
      login_and_welcome
    else
      render template: 'users/new'
    end
  end

  private

  def url_after_create
    user_wall_path(@user)
  end

  def invalid_login_details
    if password_is_invalid?
      wrong_password_error
    elsif username_is_invalid?
      username_length_error
    elsif username_unique
      username_unqiue_error
    elsif email_unique
      email_unqiue_error
    end
  end

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

  def username_unique
    User.exists?(username: @user.username)
  end

  def email_unique
    User.exists?(email: @user.email)
  end

  def username_is_invalid?
    @user.username.length < 3
  end

  def password_is_invalid?
    @user.password.length < 6 || @user.password.length > 10
  end

  def wrong_password_error
    flash[:notice] = 'Password must be between 6 - 10 characters'
    redirect_to sign_up_url
  end

  def username_length_error
    flash[:notice] = 'Username must be at least 3 characters'
    redirect_to sign_up_url
  end

  def username_unqiue_error
    flash[:notice] = 'Username taken'
    redirect_to sign_up_url
  end

  def email_unqiue_error
    flash[:notice] = 'Email already exists'
    redirect_to sign_up_url
  end

  def login_and_welcome
    sign_in @user
    flash[:signed_up] = 'You are now registered to Acebook! Welcome!'
    redirect_back_or url_after_create
  end
end
