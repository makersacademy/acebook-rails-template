class HomeController < ApplicationController
  def index
    @posts = Post.all #this is needed to display user posts their profile page (-sarah)
  end

  
end
