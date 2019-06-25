def create_user
  user = User.create(name: 'Test', email: 'test@test.com', password: '123')
end
