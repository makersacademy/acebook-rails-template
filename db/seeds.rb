# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.all.each do |user|
  user.create_wall! unless !!user.wall
  p user
  wall_id = user.wall.id
  user.posts.each do |post|
    post.update(wall_id: wall_id)
  end
end
