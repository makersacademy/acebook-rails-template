class CommentsController < ApplicationController

    def index
        @comment = Comment.all
    end
    

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(commentParams)
        if @comment.save 
          flash[:success] = "Comment successfully added"
          redirect_to posts_url
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
        params.require(:comment).permit(:comment).merge(post_id: params[:post_id])
        #params.require(:comment).permit(:comment, :post_id)
    end
end
