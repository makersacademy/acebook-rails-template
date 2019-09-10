
class WelcomeController < ApplicationController
  def index
    # this will pass the current email address in Views
    if current_user
      @user = current_user.email
    end
  end
end
