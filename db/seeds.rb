# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'tome@test.com', password: '123456')
User.create(email: 'james@test.com', password: '123456')
User.create(email: 'kim@test.com', password: '123456')
User.create(email: 'riya@test.com', password: '123456')

Post.create('message' => 'post by tome', 'user_id' => 1)
Post.create('message' => 'post by james', 'user_id' => 2)
Post.create('message' => 'post by kim', 'user_id' => 3)
Post.create('message' => 'post by riya', 'user_id' => 4)
