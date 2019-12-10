def add_posts_to_database
  Post.create(message: "hello")
  Post.create(message: "world", user_id: 2)
  Post.create(message: "Bye", user_id: 3)
end
