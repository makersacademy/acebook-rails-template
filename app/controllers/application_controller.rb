# frozen_string_literal: true

# Protects us from forgery, neat.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
