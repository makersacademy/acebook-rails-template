class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all
  end

  # POST /likes
  # POST /likes.json
  def create
    @like = Like.create(like_params)
    redirect_to posts_url
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url, notice: 'Like was successfully destroyed.' }
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
      params.permit(:user_id, :post_id)
    end
end


# potentially make show work as notification "user A liked post B"
# GET /likes/1
# GET /likes/1.json
# def show
# end

# commented out unnecessary controller methods
# respond_to do |format|
#   if @like.save
#     format.html { redirect_to @like, notice: 'Like was successfully created.' }
#     format.json { render :show, status: :created, location: @like }
#   else
#     format.html { render :new }
#     format.json { render json: @like.errors, status: :unprocessable_entity }
#   end
# end
# GET /likes/new
# def new
#   @like = Like.new
# end

# GET /likes/1/edit
# def edit
# end

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
