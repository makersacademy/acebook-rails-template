class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
    end
  end
end
