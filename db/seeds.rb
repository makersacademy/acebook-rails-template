ActiveRecord::Base.connection.disable_referential_integrity do


User.destroy_all
Post.destroy_all


user1 = User.create({email: 'elfi@test.com', password: '1234567', username: "elfi"})
user2 = User.create({email: 'angela@test.com', password: 'password', username: "angela"})

posts = [
  {message: 'What do sprinters eat before a race? Nothing, they fast!', username: "elfi", user_id: user1.id},
  {message: 'Why did the scarecrow win an award? Because he was outstanding in his field!',username: "angela", user_id: user2.id}
 ]

posts.each do |post|
  new_post = Post.create(post)
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
end
