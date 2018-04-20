# frozen_string_literal: true

class OnlineController < ApplicationController
  def index
    @users = User.all
  end
end
