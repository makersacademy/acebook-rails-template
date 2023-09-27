class ErrorsController < ApplicationController
  def not_found
    @username = nil
    if user_signed_in?
      @username = current_user.username
    end 
    render status: 404
  end
end
