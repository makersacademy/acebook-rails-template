class ErrorsController < ApplicationController
  def not_found
    @username = current_user.username
    render status: 404
  end
end
