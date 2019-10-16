class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticated?
    session[:user_id] == @post.user_id || session[:user_id] == @post.recipient_id
  end
end
