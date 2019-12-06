def add_posts_to_database
  Post.create(message: "hello")
  Post.create(message: "world")
  Post.create(message: "Bye")
end
