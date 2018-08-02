# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
user1 = User.create( { email: 'hello1@gmail.com', password: 'hello1', username: 'Gru' })
  post1 = user1.posts.create(  {message: 'I love minions'} )
user2 = User.create( { email: 'hello2@gmail.com', password: 'hello2', username: 'The underminer' })
  post2 = user2.posts.create( {message: 'Consider yourself undermined.'} )
