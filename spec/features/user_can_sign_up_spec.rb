require 'rails_helper'

RSpec.feature "Sign_up", type: :feature do

  scenario "gets redirected to index/welcome page if not already signed up" do
    visit "/posts"
    expect(current_path).to eq '/'
  end

  scenario "can access sign up page" do
    visit "/"
    click_link "Sign Up"
    expect(page).to have_content("Sign up")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password (6 characters minimum)")
  end

  scenario 'Can create a new user account' do
    visit "/"
    click_link "Sign Up"
    fill_in 'user[first_name]', with: 'John'
    fill_in 'user[last_name]', with: 'Doe'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content("You have signed up successfully")
  end
end
