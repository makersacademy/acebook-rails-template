class AlbumController < ApplicationController
  # before_action :set_album, only: [:show, :edit, :update, :destroy]

  def create
    @album = Album.new(album_params)
    redirect_to profile_index_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:title, images: [])
    end
end
