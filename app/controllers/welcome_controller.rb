# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @posts = Post.show
    end
  end

end
