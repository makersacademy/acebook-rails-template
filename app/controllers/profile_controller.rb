class ProfileController < ApplicationController
  
  def index
    puts "hello"
    p params.inspect
    @user = User.find_by_id(params[:id])
    id = @user.id
    @posts = Post.all
    @albums = Album.all
  end


end
