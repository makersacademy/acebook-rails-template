# frozen_string_literal: true

class MainController < ApplicationController
  before_action :load_posts, only: :index

  def index
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  private

  def load_posts
    @posts = Post.order('created_at desc').limit(25)
  end
end
