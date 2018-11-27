# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
User.create(
  [
    {
      firstname: 'Jenny',
      lastname: 'Laynon',
      username: 'jl',
      email: 'jen@leynon.com',
      password: 'jenjen'
    }
  ]
)

Post.create(
  [
    {
      message: 'This is a message',
      created_at: '2018-11-26 13:30:53 UTC',
      updated_at: '2018-11-27 13:30:53 UTC',
      user_id: 1
    }
  ]
)
