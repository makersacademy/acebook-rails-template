# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< HEAD
  
  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end

=======
  include SessionsHelper
>>>>>>> 87748b41687fa4899d40807cf6788e44ec26b571
end
