class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
      posts_path
      end

  def after_update_path_for(user)
        posts_path
          end

#   def after_sign_in_path_for(resource)
#   stored_location_for(resource) || welcome_path
# end

end
