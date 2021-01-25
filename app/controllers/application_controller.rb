class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  get '/' do
    "Hello World"
  end
end
