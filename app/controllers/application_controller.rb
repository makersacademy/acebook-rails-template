class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #finds the application helper and includes it so its available. 
  include ApplicationHelper

  include SessionsHelper
end
