# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = [
  {first_name: 'Jay', last_name: 'Issuree', user_name: 'Namast-Jay', email: 'jay@mail.com', password: 'jesssmells'},
  {first_name: 'Jess', last_name: 'Marais', user_name: 'JessRocksSocks', email: 'jess@mail.com', password: 'jaysmells'}
  ]

users.each do |user|
  User.create(user)
end
