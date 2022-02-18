# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :check_signed_in

  def check_signed_in
    redirect_to posts_index_url if signed_in?
  end
  
  def index
    # respond_to do |format|
    #   if user_signed_in?
    #     format.html { redirect_to posts_index_url }
    #   end
    # end
  end
end
