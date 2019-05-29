class SearchController < ApplicationController
  def index
    @posts = Post.where("message like ?", "%#{params[:query]}%")
  end
end
