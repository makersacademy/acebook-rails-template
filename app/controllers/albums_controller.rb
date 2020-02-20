# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show edit update destroy]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show; end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit; end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |f|
      if @album.save
        f.html { redirect_to @album, notice: 'Album created.' }
        f.json { render :show, status: :created, location: @album }
      else
        f.html { render :new }
        f.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |form|
      if @album.update(album_params)
        form.html { redirect_to @album, notice: 'Album was updated.' }
        form.json { render :show, status: :ok, location: @album }
      else
        form.html { render :edit }
        form.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album annihilated' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, images: [])
  end
end
