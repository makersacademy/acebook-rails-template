class Wall

  attr_reader :id, :posts

  def initialize(id)
    @id = id
    @posts = []
  end

  def add_posts
    posts = Post.where(wall_id: id).order('updated_at DESC')
    posts.each { |post| @posts << post }
  end

end
