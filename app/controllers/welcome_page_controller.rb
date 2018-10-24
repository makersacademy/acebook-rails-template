# frozen_string_literal: true

# Runs the logic for the welcome page.
class WelcomePageController < ApplicationController
  def welcome; end

  def new
    @post = Post.new
  end
end
