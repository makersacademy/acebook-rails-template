class RoomsController < ApplicationController
  skip_before_action :authenticated_user

  def show
    @messages = Message.all
    @message = Message.new
  end
end
