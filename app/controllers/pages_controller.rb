class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:welcome, :home]
  def home
  end

  def welcome
  end
end
