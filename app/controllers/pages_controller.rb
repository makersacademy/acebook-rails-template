class PagesController < ApplicationController
  def index
  end

  def home
    @posts = Post.all

  end

  def profile
    #grab the username from the url as # ID;
        if (User.find_by_username(params[:id]))
          @username = params[:id]
        else
     # redirect to 404 (root for now)
           redirect_to root_path, :notice=> "User not found!"
        end

   end

  def explore
    @posts = Post.all

  end
end
