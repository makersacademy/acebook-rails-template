# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    p params
    p user = User.find_by(email: params[:user][:email])

    if user.valid?
      redirect_to posts_url
    end
  end
end
