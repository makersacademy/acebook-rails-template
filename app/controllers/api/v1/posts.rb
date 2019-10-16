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
      end
    end
  end
end
