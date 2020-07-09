class RoomsController < ApplicationController
  def show
    @messages = Message.all.reverse
  end
end
