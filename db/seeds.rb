# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all

users = [
  { email: 'test_1@test.com', password: 'password'},
  { email: 'test_2@test.com', password: 'password'},
  { email: 'test_3@test.com', password: 'password'}
]

users.each do |user|
  User.create(user)
end

# posts = [
#   { message: 'Hello world one' },
#   { message: 'Hey this is a message two' },
#   { message: 'Another message.......three' }
# ]
#
# posts.each do |post|
#   Post.create(post)
# end
