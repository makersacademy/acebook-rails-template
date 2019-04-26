# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create(first_name: 'Germany', last_name: 'chen', email: 'alexbaggio315@gmail.com', password:'asdfgh')

user = {}
user['password'] = 'asdfss'

ActiveRecord::Base.transaction do
  20.times do
    user['first_name'] = Faker::Name.first_name
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email

    User.create(user)
  end
end

post = {}
uids = []
User.all.each {|u| uids << u.id}

ActiveRecord::Base.transaction do 
  20.times do 
    post['message']= Faker::Hipster.sentence
    post['user_id']= uids.sample
    Post.create(post)
  end 
<<<<<<< HEAD
end 
=======
end 
>>>>>>> 9684f82290b4e1cb2bf4e3e6535b657fcfad5662
