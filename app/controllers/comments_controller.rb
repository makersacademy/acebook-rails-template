class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    render 'new'
  end


end
