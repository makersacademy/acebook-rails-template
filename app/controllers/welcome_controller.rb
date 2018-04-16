# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index;
    # if current_user.nil?
    #   redirect_to welcome_index_url
    # else
    #   redirect_to posts_url
    # end
  end
end
