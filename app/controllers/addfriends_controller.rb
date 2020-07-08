# frozen_string_literal: true

class AddfriendsController < ApplicationController
  def index
    # pull data from database
    params[:id] = session[:user_id]
  end
end
