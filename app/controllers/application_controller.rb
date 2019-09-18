# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def after_sign_out_path_for(_resource)
    root_path
  end
end
