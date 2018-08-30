# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authorize
    redirect_to '/login' unless current_user
  end
end
