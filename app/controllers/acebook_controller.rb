class AcebookController < ApplicationController

  def index
  end

  def create
    @post = Post.new(params.require(:post).permit(:content))
    @post.save
    render 'index'
  end

end
