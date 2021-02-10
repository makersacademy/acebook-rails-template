# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'Charlotte', password: 'this_is_a_password', full_name: 'Charlotte Cole', email: 'charlotte@gmail.com', mobile: '07474289731', address: 'London,UK', url: 'https://www.acebook.com/users/2')
Post.create(content: 'Hello World', user_id: '1')
Comment.create(content: 'This is a great post!', user_id: '1', post_id: '1')
#   Character.create(name: 'Luke', movie: movies.first)