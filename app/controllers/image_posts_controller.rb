# frozen_string_literal: true

# Allows us to upload image posts to our app
class ImagePostsController < ApplicationController
  before_action :set_image_post, only: %i[show edit update destroy]

  # GET /image_posts
  # GET /image_posts.json
  def index
    @image_posts = ImagePost.all
  end

  def user_images
    @user = current_user
  end

  # GET /image_posts/1
  # GET /image_posts/1.json
  def show
    set_image_post if params[:id]
  end

  # GET /image_posts/new
  def new
    @image_post = ImagePost.new
    @user = current_user
  end

  # GET /image_posts/1/edit
  def edit; end

  # POST /image_posts
  # POST /image_posts.json
  def create
    @image_post = ImagePost.new(image_post_params)
    respond_to do |format|
      @image_post.save
      format.html do
        redirect_to @image_post,
                    notice: 'Image post was successfully created.'
      end
      format.json { render :show, status: :created, location: @image_post }
    end
  end

  # PATCH/PUT /image_posts/1
  # PATCH/PUT /image_posts/1.json
  def update
    respond_to do |format|
      @image_post.update(image_post_params)
      format.html do
        redirect_to @image_post,
                    notice: 'Image post was successfully updated.'
      end
      format.json { render :show, status: :ok, location: @image_post }
    end
  end

  # DELETE /image_posts/1
  # DELETE /image_posts/1.json
  def destroy
    @image_post.destroy
    respond_to do |format|
      format.html do
        redirect_to image_posts_url,
                    notice: 'Image post was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_image_post
    @image_post = ImagePost.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list.
  def image_post_params
    output = params.require(:image_post).permit(:caption, :picture)
    output.merge(user_id: current_user.id)
  end
end
