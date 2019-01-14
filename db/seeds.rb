# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'hello@test.com', password: 'hello2')
User.create(firstname: 'Sam', lastname: 'A', email: 'hello1@test.com', password: 'hello2')
User.create(firstname: 'David', lastname: 'B', email: 'hello2@test.com', password: 'hello2')
User.create(firstname: 'Sam', lastname: 'Abc', email: 'hello3@test.com', password: 'hello2')
