# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.new
user.username = 'Namast-Jay'
user.password = 'jaysmells'
user.email = 'jay@mail.com'
user.save!


user = User.new
user.username = 'JessRocksSocks'
user.password = 'jesssmells'
user.email = 'jess@mail.com'
user.save!

post = Post.new
post.message = "This is my awesome message about messages"
post.user_id = 1
post.save!

post = Post.new
post.message = "Second awesome message about messages"
post.user_id = 2
post.save!
