class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]
  before_action :find_post

  # GET /likes/1
  # GET /likes/1.json
  def show
  end

  # Why are we not using the likes controller to make new Likes? Is this best practice?
  # # GET /likes/new
  # def new
  #   @like = Like.new
  # end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes
  # POST /likes.json
  def create
    if already_liked?
      redirect_to posts_path, notice: 'Already liked.'
    else
      process_like
    end
  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  # def update
  #   respond_to do |format|
  #     if @like.update(like_params)
  #       format.html { redirect_to @like, notice: 'Like was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @like }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @like.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /likes/1
  # DELETE /likes/1.json

  def destroy_like_on_post
    like = Like.where('user_id = ? AND post_id = ?', current_user.id, @post.id).first
    Like.destroy(like.id)
    redirect_to posts_path

  end

  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_like
    @like = Like.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def like_params
    params.fetch(:like, {})
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
        params[:post_id]).exists?
  end

  def success_message(like, format)
    format.html { redirect_to posts_path, notice: 'Like was successfully created.' }
    format.json { render "posts/index", status: :created, location: like }
  end

  def process_like
    respond_to do |format|
      like = @post.likes.create(user_id: current_user.id)
      if like.save
        success_message(like, format)
      end
    end
  end
end
