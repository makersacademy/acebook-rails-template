require 'rails_helper'

RSpec.feature 'User profile', type: :feature do

  scenario 'user can visit profile with their username' do
    user = User.create(first_name: 'John', last_name: 'Doe', email: 'test@test.com', password: 'password', username: 'john')
    visit "/"
    login_user
    visit "/john"
    expect(page).to have_content("John Doe")
  end

  scenario 'visiting link with wrong username redirects to 404' do
    user = User.create(first_name: 'John', last_name: 'Doe', email: 'test@test.com', password: 'password', username: 'john')
    visit "/"
    login_user
    visit "/johns"
    expect(page).to have_content("User doesn't exist")
  end
end
