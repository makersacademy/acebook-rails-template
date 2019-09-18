class AlbumsController < ApplicationController

  def show

    @album = Album.find(params[:id])
    p @album
    p @album.id
    @user = User.find(@album.user_id)
  end

  def create
    if current_user

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


    # def update
    #   @album = Album.find(params[:id])
    #   redirect_to  album_path(@album)
    # end


      def update
        @album = Album.find(params[:id])
        @user_id_from_album = @album.user_id
        if @user_id_from_album != current_user.id
          redirect_to albums_path, notice: 'Thats not your album!'
        else
          @album = current_user.albums.find(params[:id])
          if @album.update(album_params)
            redirect_to albums_path
          else
            render 'edit'
          end
        end
      end


  private

  def album_params
    params.require(:album).permit(:image, :user_id, :title)
  end

end
