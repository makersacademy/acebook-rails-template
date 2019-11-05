class Users::CallbacksController < Devise::OmniauthCallbacksController
  def github
    # @user = User.from_omniauth(request.env["omniauth.auth"])
    # signin_and_redirect @user
    @user = User.find_or_create_for_github(env["omniauth.auth"])
    flash[:notice] = "Signed in with GitHub successfully."
    sign_in_and_redirect @user, :event => :authentication
  end
end
