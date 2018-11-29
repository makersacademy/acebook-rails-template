class AlbumsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @albums = @user.albums
  end
end
