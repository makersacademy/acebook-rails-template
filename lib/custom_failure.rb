class CustomFailure < Devise::FailureApp
  def redirect_url
    new_user_session_url(:subdomain => 'secure')
  end

  # Redirect to root_url
  def respond
    if http_auth?
      http_auth
    else
      redirect_to root_url
    end
  end
end
