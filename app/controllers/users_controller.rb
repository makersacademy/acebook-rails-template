class UsersController < Clearance::UsersController
  before_action :redirect_signed_in_users, only: [:create, :new]
  skip_before_action :require_login, only: [:create, :new], raise: false

  def new
    @user = user_from_params
    render template: "users/new"
  end

  def create
    @user = user_from_params
    if params[:user][:password].to_s.length < 6 || params[:user][:password].to_s.length > 10
      redirect_to sign_up_path, flash: { error: "password would require 6 to 10 characters" }
    elsif @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  private

  def redirect_signed_in_users
    if signed_in?
      redirect_to Clearance.configuration.redirect_url
    end
  end

  def url_after_create
    Clearance.configuration.redirect_url
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
