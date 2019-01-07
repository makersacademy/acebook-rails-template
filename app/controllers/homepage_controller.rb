class HomepageController < ApplicationController
  def index
    @home = 'home'
    # redirect_to new_user_registration_path
  end
end
