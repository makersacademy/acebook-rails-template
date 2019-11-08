require 'rails_helper'

RSpec.feature 'user login', type: :feature do
  scenario 'user can access login page' do
    visit "/"
    click_link "Log In"
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Log in")
  end

  scenario 'user can login' do
    user = create_user
    visit "/"
    click_link "Log In"
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    expect(page).to have_content("Signed in successfully")
    expect(current_path).to eq ("/users/#{user.id}")
  end

  scenario "user can access any user's wall while logged in only " do
    user = create_user
    user_2 = create_user_two
    login_user
    expect(current_path).to eq ("/users/#{user.id}")
    visit "/users/#{user_2.id}"
    expect(page).to have_content("Jonny's Profile")
  end

  scenario "user cannot access another user's wall if they are not signed in" do
    user = create_user
    user_2 = create_user_two
    visit "/users/#{user_2.id}"
    expect(page).not_to have_content("Jonny's Profile")
  end

end
