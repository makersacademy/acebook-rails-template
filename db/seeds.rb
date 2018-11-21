# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 1
User.create(name: 'testUser', email: 'test@user.com', password: 'qwerty',
   encrypted_password: '$2a$11$stuRQsXboDka1QSaS5WNHe2IBidCiKabwk3p9TVUiIJiBQ8R9W3J6').save!
puts 2
