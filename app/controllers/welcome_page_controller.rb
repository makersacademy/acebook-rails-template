# frozen_string_literal: true

# Runs the logic for the welcome page.
class WelcomePageController < ApplicationController
  def welcome
    if user_signed_in?
      @posts = Post.all
      render 'timeline'
    else
      render 'sign_in'
    end
  end

  def sign_in; end

  def timeline; end
end
