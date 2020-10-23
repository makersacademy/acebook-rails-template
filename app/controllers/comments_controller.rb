class CommentsController < ApplicationController

    def index
        @comment = Comment.all
      end
    

    def new
        @comment = Comment.new
      end

    def create
        # @post = Post.find(params[:post_id])
        @comment = Comment.new(commentParams)
           if @comment.save 
            flash[:success] = "Comment successfully added"
            redirect_to post_url
           else 
            render "new"
           end
        
    end 

    def show 
        @comment = Comment.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comment.find(params[:id])
        @comment.destroy
        redirect_to post_url
    end

    def commentParams
        params.require(:comment).permit(:comment, :post_id)
    end
end
