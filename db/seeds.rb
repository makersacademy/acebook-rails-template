# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create({username: "tester", email: "test@test.com", password: "tester123"})
user = User.new
user.email = "test@test.com"
user.encrypted_password = ""
Post.create({user_id: 1, message: "test123"}}
Registrations.session.new({email: "test@test.com", password: "tester123"})
