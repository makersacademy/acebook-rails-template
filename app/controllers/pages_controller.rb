class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:welcome]
 
  def welcome
  end
end
