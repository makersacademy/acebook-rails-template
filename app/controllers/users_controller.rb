class UsersController < Clearance::UsersController
  before_action :redirect_signed_in_users, only: [:create, :new]
  skip_before_action :require_login, only: [:create, :new], raise: false
  def new

    @user = user_from_params
    render template: "users/new"
  end

  def create

    @user = user_from_params
    if invalid_sign_up
      sign_up_error
    elsif @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  private

  def redirect_signed_in_users
    redirect_to Clearance.configuration.redirect_url if signed_in?
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def invalid_sign_up
    wrong_char_password || @user.password != params["confirmation-password"]
  end

  def wrong_char_password
    @user.password.length < 6 || @user.password.length > 10
  end 

  def sign_up_error
    if @user.password.length < 6 || @user.password.length > 10
      redirect_to sign_up_path, flash: { error: "password would require 6-10 characters " }
    else
      redirect_to sign_up_path, flash: { error: "passwords not the same " }
    end
  end 

  def user_from_params
    
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end
end
