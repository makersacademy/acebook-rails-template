# frozen_string_literal: true

require_relative '../models/sessions.rb'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private
def authenticate_user!
  if user_signed_in?
    super
  else
    redirect_to your_path, notice: "Please log in to view that page"
  end
end

end
