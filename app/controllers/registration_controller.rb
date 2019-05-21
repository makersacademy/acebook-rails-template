class RegistrationController < ApplicationController
  def sign_up

  end

  def users
    user = params[:name]
    print user
  end
end
