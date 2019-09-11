class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @post }
    end
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

    @post = Post.find(params[:id])
    
    respond_to do |format|
      if @post.update_attributes(params[:message])
        
        format.html { redirect_to(@post,
                      :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
