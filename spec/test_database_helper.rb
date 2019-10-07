def populate_test_database(message)
  @post = Post.create(message: message)
  @post.save
end
