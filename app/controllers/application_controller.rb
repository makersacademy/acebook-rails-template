class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: [:home]

  private

    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to root_path, notice: "Please Login to view that page!" if request.original_fullpath != root_path
      end
    end
end
