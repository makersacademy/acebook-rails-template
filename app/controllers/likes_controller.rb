class LikesController < ApplicationController
  def create

    @parent_object = like_or_comment(params)


    # if params[:comment_id]
    #   @like = Like.find_or_create_by(comment_id: params[:comment_id])
    # else
    #   @like = Like.find_or_create_by(post_id: params[:post_id])
    # end
    # @like = Like.find_by_or_create()
    @like = @parent_object.likes.build(user_id: current_user.id)

    10.times { p @like }
    # 10.times { p @parent_object.likes }


    @like.save!

    # @post = Post.find(params[:post_id])
    # @post.likes.create(user_id: current_user.id)
    redirect_to posts_url



  end

  def destroy
    # @post = Post.find(params[:post_id])
    # @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    # @like.destroy
    # redirect_to posts_url
    10.times { p 'destroy motherfucker' }
  end

  private

    def like_or_comment(params)
      if params[:comment_id]
        return Comment.find_by(id: params[:comment_id])
      else
        return Post.find_by(id: params[:post_id])
      end
    end

    # def like_params
    #   params.require(:like).permit(:user_id,:comment_id)
    # end


end
