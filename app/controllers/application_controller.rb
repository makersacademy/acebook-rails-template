class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_signup

private

  def require_signup
    puts 'there'
    return false if current_user

puts 'here'
    redirect_to signup_url
    end
  end
