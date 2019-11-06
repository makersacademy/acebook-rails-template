class MyFailureApp < Devise::FailureApp
  def route(scope)
    :index
  end
end
