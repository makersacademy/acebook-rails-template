class TimelinePostsController < ApplicationController
  before_action :set_timeline_post, only: [:show, :edit, :update, :destroy]

  # GET /timeline_posts
  # GET /timeline_posts.json
  def index
    @timeline_posts = TimelinePost.all
  end

  # GET /timeline_posts/1
  # GET /timeline_posts/1.json
  def show
  end

  # GET /timeline_posts/new
  def new
    @timeline_post = TimelinePost.new
  end

  # GET /timeline_posts/1/edit
  def edit
  end

  # POST /timeline_posts
  # POST /timeline_posts.json
  def create
    @timeline_post = TimelinePost.new(timeline_post_params)
    @timeline_post.poster_id = session[:current_user]
    @timeline_post.posted_id = params[:timeline_post][:id].to_i
    @timeline_post.time = Time.now
    respond_to do |format|
      if @timeline_post.save
        format.html { redirect_to '/users/' + session[:current_user].to_s + '/timeline', notice: 'Timeline post was successfully created.' }
        format.json { render :show, status: :created, location: @timeline_post }
      else
        format.html { render :new }
        format.json { render json: @timeline_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timeline_posts/1
  # PATCH/PUT /timeline_posts/1.json
  def update
    respond_to do |format|
      if @timeline_post.update(timeline_post_params)
        format.html { redirect_to '/users/' + session[:current_user].to_s + '/timeline', notice: 'Timeline post was successfully updated.' }
        format.json { render :show, status: :ok, location: @timeline_post }
      else
        format.html { render :edit }
        format.json { render json: @timeline_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timeline_posts/1
  # DELETE /timeline_posts/1.json
  def destroy
    @timeline_post.destroy
    respond_to do |format|
      format.html { redirect_to timeline_posts_url, notice: 'Timeline post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeline_post
      @timeline_post = TimelinePost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timeline_post_params
      params.require(:timeline_post).permit(:content)
      # params.require(:timeline_post).permit(:content, :poster, :posted)
    end
end
