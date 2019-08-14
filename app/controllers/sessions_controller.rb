# frozen_string_literal: true

class SessionsController < ApplicationController
  # skip_before_action :require_login
  def create
    session[:current_session] = params[:authenticity_token]
  end

  def index; end
end
