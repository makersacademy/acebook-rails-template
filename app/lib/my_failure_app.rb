class MyFailureApp < Devise::FailureApp
  def route(scope)
    scope.to_sym == :user ? :new_user_registration_url : super
  end
end
  