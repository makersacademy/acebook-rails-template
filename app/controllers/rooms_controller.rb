class RoomsController < ApplicationController
  def show
    @message = Message.all
  end
end
