class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    album = Album.create(name: post_params, user_id: current_user.id)
    redirect_to "/albums/#{album.id}"
  end

  def index
  end

  def show
    @album = Album.find(params[:id])
  end

  def new_photo
    @album = Album.new
  end

  private

  def post_params
    params.require(:album).require(:name)
  end
end
