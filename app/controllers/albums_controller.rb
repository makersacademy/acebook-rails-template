# frozen_string_literal: true

class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
    @user = User.find(@album.user_id)
  end

  def create
    @album = current_user.albums.create(album_params)
    redirect_to albums_url
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
    # @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  def update
    @album = Album.find(params[:id])
    @user_id_from_album = @album.user_id
    if @user_id_from_album != current_user.id
      flash[:error] = "That's not your album!"
      redirect_to albums_path
    else
      @album = current_user.albums.find(params[:id])
      if @album.update(album_params)
        redirect_to albums_path
      else
        render 'edit'
      end
    end
  end

  def delete_image_attachment
    @image = ActiveStorage::Blob.find(params[:id])
    p '------------------'
    # p @image
    @image.purge_later
    redirect_to albums_url
  end

  private

  def album_params
    params.require(:album).permit(:user_id, :title, images: [])
  end
end
