# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(_resource)
    # return the path based on resource
    '/posts'
  end

  def destroy_user_session_path; end
end
