class Sign-in < ApplicationController
  def new
    @username = Signin.new
    @password = Signin.new
  end

  def create
