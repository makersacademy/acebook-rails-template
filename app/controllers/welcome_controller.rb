# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :save_login_state
  def index; end
end
