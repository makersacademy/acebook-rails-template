class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params) { |c| c.user_id = current_user.id }
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    @post = Post.find(params[:id])
    # redirect_to posts_path(@post)
  end

  def update
      @post = Post.find(params[:id])
    if @post.update(post_params)
      p ("in first conditional")
      redirect_to :back
    else
      p ("in second conditional")
      render :edit
      redirect_to posts_url
    end
    # @post = Post.find(params[:id])
    # @post.update(entry_params)
    # redirect_to posts_path
    # respond_to do |format|
    #   if @post.update(entry_params)
    #     format.html { redirect_to posts_path, notice: 'Entry was successfully updated.' }
    #     # format.json { render :show, status: :ok, location: @post }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end

# def update
#     respond_to do |format|
#       if @entry.update(entry_params)
#         format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
#         format.json { render :show, status: :ok, location: @entry }
#       else
#         format.html { render :edit }
#         format.json { render json: @entry.errors, status: :unprocessable_entity }
#       end
#     end
#   end
