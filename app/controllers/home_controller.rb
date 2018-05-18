# frozen_string_literal: true

# manages home page folowing auth
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    redirect_to posts_path
  end
end
