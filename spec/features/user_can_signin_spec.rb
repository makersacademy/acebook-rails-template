require 'rails_helper'

RSpec.feature "Sign in", type: :feature do 

  scenario "Existing User can sign in" do 
    create_test_user_and_login("signin_test@example.com", "123456")
    expect(current_path).to eq('/posts')
  end 

  scenario "Users password is incorrect" do
    User.create(name: 'Test Name', email: 'signin_test@example.com', password: '123456')
    visit('/posts')
    fill_in "user_email", with: "test@example.com" 
    fill_in "user_password", with: "incorrect" # incorrect Password
    click_button("Log in")
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario "Users email is incorrect" do
    User.create(name: 'Test Name', email: 'signin_test@example.com', password: '123456')
    visit('/posts')
    fill_in "user_email", with: "incorrect@example.com" # incorrect email
    fill_in "user_password", with: "123456"
    click_button("Log in")
    expect(page).to have_content("Invalid Email or password.")
  end

end 
