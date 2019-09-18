class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
  end

  def create
    if current_user
    @album = Album.create(album_params)
    @album = current_user.albums.create(album_params)
    redirect_to albums_url
    end
  end

  def new
    @album = Album.new
  end

  def index
    @albums = current_user.albums.all
  end

  def edit
    @album = Album.find(params[:id])
    @user_id_from_album = @album.user_id
  end

  def destroy
    @album = Album.find(params[:id])
    @user_id_from_album = @album.user_id
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  private

  def album_params
    params.require(:album).permit(:image, :user_id, :title)
  end

end
