class ProfileController < ApplicationController
  
  def index
    @photo = ActiveStorage::Blob.find_by(:id => 26)
    @user = User.find_by_id(params[:id])
    #id = @user.id
    @posts = Post.all
    @albums = Album.all
  end
end
