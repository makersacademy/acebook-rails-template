class PagesController < ApplicationController

  def index
    @posts = Post.all
    @posts = Post.order('updated_at DESC')
  end

end
