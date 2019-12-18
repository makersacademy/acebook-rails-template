# frozen_string_literal: true

def setup_test_db
  ActiveRecord::Base.connection.execute('TRUNCATE posts RESTART IDENTITY CASCADE;')
  ActiveRecord::Base.connection.execute('TRUNCATE users RESTART IDENTITY CASCADE;')
  user = User.create(email: 'someone@gmail.com', password: 'Abc123.')
  Post.create(message: 'Hello, world!', user_id: user.id)
end
