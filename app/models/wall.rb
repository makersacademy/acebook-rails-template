class Wall

  attr_reader :id, :posts

  def initialize(id)
    @id = id
    @posts = []
  end

  def add_posts
    posts = Post.where(wall_id: id)
    posts.each { |post| @posts << post.message }
  end

end
