# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(username: 'qnmq', firstname: 'Sam', lastname: 'A', email: 'asdijioj@test.com', password: 'hello2', birthday: '11/02/1978', bio: 'habitant morbi tristique eugiat quis nibh molestie, eleifend aliquet tortor.')
user2 = User.create!(username: 'aosidj', firstname: 'Wayne', lastname: 'A', email: 'hellox@test.com', password: 'hello2', birthday: '01/02/1998', bio:  'Praesent consequat, mauris ac volutpat feugiat quis nibh molestie, eleifend aliquet tortor.')
user3 = User.create!(username: '102983sd', firstname: 'Jim', lastname: 'B', email: 'hello2@test.com', password: 'hello2', birthday: '05/01/1988', bio:  'feugiat quis nibh molestie, eleifend Praesent consequat, mauris ac volutpat aliquet tortor.')
user4 = User.create!(username: 'asdgg', firstname: 'Gary', lastname: 'darth', email: 'hello3@test.com', password: 'hello2', birthday: '04/03/1948', bio: 'feugiat quis nibh molestie, eleifend aliquet tortor.Praesent consequat, mauris ac volutpat ')
user5 = User.create!(username: 'vmmd', firstname: 'Tom', lastname: 'phil', email: 'hello7@test.com', password: 'hello2', birthday: '06/08/1968', bio: 'Integer eu nisi id sapien ornare eugiat quis nibh molestie, eleifend aliquet tortor.')
user6 = User.create!(username: '2djs', firstname: 'James', lastname: 'egg', email: 'hello9@test.com', password: 'hello2', birthday: '12/06/1998', bio: 'feugiat quis nibh molestie, eleifend aliquet tortor.')

post1 = user1.posts.create(message: 'Aenean eu nisl commodo, laoreet quam nec, rutrum magna. Pellentesque accumsan rutrum suscipit. In hac habitasse platea dictumst.')
post2 = user1.posts.create(message: ' rutrum magna. Pellentesque accumsan rutrum suscipit. In hac habitasse platea dictumst.')
post3 = user2.posts.create(message: 'Class aptent taciti sociosqu ad litora torquent per conubia nostra')
post4 = user3.posts.create(message: ' aptent taciti sociosqu ad litora torquent per conubia nostra')

Comment.create(user_id: user1.id, post_id: post1.id, content: 'Aliquam erat volutpat.')
Comment.create(user_id: user2.id, post_id: post2.id, content: 'Pellentesque habitant morbi tristique senectus et netus et ')
Comment.create(user_id: user3.id, post_id: post1.id, content: 'hello_new_test_comment ')
Comment.create(user_id: user2.id, post_id: post1.id, content: 'this_is_a_new_comment ')
