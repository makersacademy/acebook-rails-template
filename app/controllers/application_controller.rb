# frozen_string_literal: true

# Application controller, with authentication method
class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  protect_from_forgery with: :null_session
end
