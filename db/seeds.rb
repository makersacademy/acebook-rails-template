# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  posts = Post.create([ { message: 'You\'ll never catch me alive' },
                        { message: 'I\'m robbing a bank tomorrow, who\'s coming?' },
                        { message: 'Good, illegal is always faster' },
                        { message: 'The criminal is the creative artist, the detective only the critic' },
                        { message: 'Oh, yes, there will be blood' }])

  users = User.create([ { email: 'hello1@gmail.com', password: 'hello1' },
                        { email: 'hello2@gmail.com', password: 'hello2' },
                        { email: 'hello3@gmail.com', password: 'hello3' },
                        { email: 'hello4@gmail.com', password: 'hello4' }])
