def clear_user_table
  User.destroy_all
end

def create_users
  user = User.create(email:"test1@test.com", password:"password")
  user = User.create(email:"test2@test.com", password:"password")
  user = User.create(email:"test3@test.com", password:"password")
  user = User.create(email:"test4@test.com", password:"password")
end
