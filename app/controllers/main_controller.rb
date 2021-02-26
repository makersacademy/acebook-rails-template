class MainController < ApplicationController

  before_action :load_posts, only: :index

  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end

  private

  def load_posts
    @posts = Post.order("created_at desc").limit(50)
  end

end
