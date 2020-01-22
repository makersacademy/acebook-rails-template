class ErrorsController < ApplicationController
  def index
    status_code = 404
    flash.alert = "Status #{status_code}"
    render status_code.to_s, status: status_code
  end
end
