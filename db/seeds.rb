# This file should contain all the record creation needed to seed the database with its
# default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database
# with db:setup).
#
# Examples:

bob = User.create({ first_name: 'Bob', last_name: 'Jonson',
               pronoun: 'he', email: 'bob@bob.com',
               password: 'bbbbbbb', profile_pic: 'www.bob.com' })
jane = User.create({ first_name: 'Jane', last_name: 'Smith',
               pronoun: 'she', email: 'jane@jane.com',
               password: 'jjjjjjj',
               profile_pic: 'www.jane.com/pic.jpg' })

Post.create([{ user_id: bob.id, message: 'Hello World',
          updated_at: '2019-02-26 14:51:33.76532', wall: bob.id },
             { user_id: bob.id, message: 'Huzzah!',
             updated_at: '2019-02-28 14:51:33.76532', wall: jane.id },
             { user_id: jane.id, message: 'Huzzay!',
               updated_at: '2019-02-27 14:51:33.76532', wall: bob.id }])

# Character.create(name: 'Luke', movie: movies.first)
#
#   movies = Movie.create([{ name: 'Star Wars' },
# { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
