require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "user sign up button" do
    visit '/' 
    expect(page).to have_link("Sign up")
  end
  scenario "sign up button directs to /users/new" do
    visit '/'
    click_link("Sign up")
    expect(page).to have_content("Register as a User below")
    expect(current_path).to eq("/users/new")
  end
  scenario "sign up form registers user" do
    visit '/users/new'
    expect(page).to have_field("user[name]")
    expect(page).to have_field("user[email]")
    expect(page).to have_field("user[password]")
    sign_up
    expect(page).to have_content("Hello Test Johnson")
  end
  scenario 'users cannot sign up with invalid credentials' do
    visit '/users/new'
    fill_in "user[name]", with: "Big Suze"
    fill_in "user[password]", with: "Mental Posho"
    click_button 'Create User'
    expect(page).to have_content "Please fill all fields."
    expect(page).to_not have_content "Hello Big Suze"
  end
end 
