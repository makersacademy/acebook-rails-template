class ApplicationController < ActionController::Base
  before_action :require_login

  include Clearance::Controller

  protect_from_forgery with: :exception

  def index; end

  private

  def require_login
    # puts 'running require login method'
    if signed_out? && request.env['PATH_INFO'] != '/'
      flash[:error] = 'You must be logged in to access this section'
      redirect_to('/') # halts request cycle
    end
  end
end
