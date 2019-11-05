def new_user
  user = User.new
  user.email = 'test@example.com'
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save!
  return user
end
