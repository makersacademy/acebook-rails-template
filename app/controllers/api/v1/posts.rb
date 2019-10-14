module API
  module V1
    class Posts < Grape::API
      include API::V1::Defaults
      resource :posts do
        desc "Return all posts"
        get "" do
          Post.all
        end
      end
    end
  end
end