module API
  module V1
    class Posts < Grape::API
      include API::V1::Defaults
      resource :posts do
        desc "Return all posts"
        get "" do
          Post.all
        end
        desc "Delete posts"
        params do
          requires :id, type: String, desc: "id of the post"
        end
        delete "" do
          post = Post.where(id: permitted_params[:id]).first!
          post.destroy
        end
        desc "Add post"
        params do
          requires :message, type: String, desc: "message"
        end
        post "" do
          Post.create(permitted_params)
        end
        desc "Update post"
        params do
          requires :id, type: String, desc: "id of the post"
          requires :message, type: String, desc: "message"
        end
        put "" do
          p "here"
          p permitted_params
          post = Post.where(id: permitted_params[:id]).first!
          p 'post'
          p post
          post.update(permitted_params)
        end
      end
    end
  end
end

def update
  if params[:delete_button]
    destroy
  elsif params[:like_button]
    like
  else
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to posts_url
  end
end
