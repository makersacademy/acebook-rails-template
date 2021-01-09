class CustomAuthenticateUserApp < Devise::FailureApp
  def route(_scope)
    :unauthenticated_root
  end
end
