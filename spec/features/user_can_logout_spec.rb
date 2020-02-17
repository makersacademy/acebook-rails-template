scenario 'User can logout' do
  User.create!(email: 'test@test.com', password: 'password').save
  visit('/')
  click_on('Login')
  fill_in('login[email]', with: 'test@test.com')
  fill_in('login[password]', with: 'password')
  click_on('Login')
  click_on('Logout')
  expect(page).to have_content('Welcome to Acebook')
end