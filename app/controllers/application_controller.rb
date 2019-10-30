# frozen_string_literal: true

# rubocop:todo Style/Documentation
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
end
# rubocop:enable Style/Documentation
