module PostsHelper
  def post
    @post ||= current_user.posts.create
  end
end
