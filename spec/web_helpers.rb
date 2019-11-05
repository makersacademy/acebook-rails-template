def create_user 
    user = User.create(first_name: 'John', last_name: 'Doe', email: 'test@test.com', password: 'password')
end