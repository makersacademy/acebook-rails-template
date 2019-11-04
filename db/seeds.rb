# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  {first_name: 'John', last_name: 'Doe', email: 'john.doe@test.com', password_digest: 'pass'}
  {first_name: 'Anne', last_name: 'Other', email: 'anne.other@test.com', password_digest: 'pass'}
]

users.each do |user|
  new_user = User.create(user)
end