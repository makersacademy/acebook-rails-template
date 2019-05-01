class CustomFailure < Devise::FailureApp
  def route(scope)
    :new_user_registration_url
  end
end
