class CommentsController < ApplicationController
    before_action :find_comment, only: [:show, :edit, :update, :destroy]

    def index
        @comment = Comment.all
    end
    

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(comment_params)
        if @comment.save 
          flash[:success] = "Comment successfully added"
          redirect_to posts_url
        else 
         render "new"
        end
    end 

    def show 
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
          redirect_to posts_path
        else
          render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment.destroy
        redirect_to post_url
    end

    private

    def find_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:comment, :post_id).merge(user_id: current_user.id)
    end
end
