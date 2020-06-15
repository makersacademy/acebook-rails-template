class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def redirect_to_index_if_not_signed_in
    redirect_to '/' unless signed_in?
  end
end
