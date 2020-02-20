# frozen_string_literal: true

class RoomsController < ApplicationController
  skip_before_action :authenticated_user

  def show
    @messages = Message.last(15)
    @message = Message.new
  end
end
