class MyFailureApp < Devise::FailureApp
  def route(scope)
    :root_path
  end
end