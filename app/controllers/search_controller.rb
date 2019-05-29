class SearchController < ApplicationController
  def index
    @posts = Post.where("message like ?", "%#{params[:query]}%")
    @posts = Post.all.order(created_at: :desc)
  end
end
