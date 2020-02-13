# frozen_string_literal: true

class WelcomeController < ApplicationController
  skip_before_action :require_login

  def index; end
end
