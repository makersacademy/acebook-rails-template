# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    authenticate_user
  end

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    # respond_to do |format|
    #   format.html 
    #   format.xml { render :xml => @user }
    # end
  end

  private

  def authenticate_user
    redirect_to '/' unless user_signed_in?
  end
end
