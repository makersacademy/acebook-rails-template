class ApplicationController < ActionController::Base
  p self.superclass
  protect_from_forgery with: :exception
  include SessionsHelper
end
