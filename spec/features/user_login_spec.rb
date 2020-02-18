RSpec.feature 'Users can login to site', type: :feature do
  scenario 'Can visit login page' do
    visit('/')
    click_on('Login')
    expect(page).to have_content('Please Login')
  end

  scenario 'User cannot login with incorrect email format' do
    visit('/')
    click_on('Login')
    fill_in('login[email]', with: 'test@testcom')
    fill_in('login[password]', with: 'password')
    click_on('HERRNNNGGGHHHHH')
    expect(page).to have_content('Email format invaild, please enter valid email')
  end

  scenario 'User login with invalid email' do
    visit('/')
    click_on('Login')
    fill_in('login[email]', with: 'test@test.com')
    fill_in('login[password]', with: 'password')
    click_on('HERRNNNGGGHHHHH')
    expect(page).to have_content('Login not found')
  end

  scenario 'User login with invalid password' do
    User.create!(email: 'test@test.com', password: 'password').save
    visit('/')
    click_on('Login')
    fill_in('login[email]', with: 'test@test.com')
    fill_in('login[password]', with: 'notmine')
    click_on('HERRNNNGGGHHHHH')
    expect(page).to have_content('Login not found')
  end

  scenario 'User can login' do
    User.create!(email: 'test@test.com', password: 'password').save
    visit('/')
    click_on('Login')
    fill_in('login[email]', with: 'test@test.com')
    fill_in('login[password]', with: 'password')
    click_on('HERRNNNGGGHHHHH')
    expect(page).to have_content('Welcome back test@test.com!')
  end
end
