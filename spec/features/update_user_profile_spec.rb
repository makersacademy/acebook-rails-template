require 'rails_helper'

RSpec.feature 'Updating user profile' do
  scenario 'users can update their name' do
    user = User.create(id: 20, name: "New user", email: "new_user@email.com", password: "Password123")
    visit '/'
    click_link 'Log In'
    fill_in "Email", with: "new_user@email.com"
    fill_in "Password", with: "Password123"
    click_button "Log in"
    visit '/users/20'
    click_link 'Edit'
    fill_in "Name", with: "Changed"
   click_button "Submit"
   expect(page).to have_content "Changed's Profile"
  end

  scenario "Users can update their password" do
    user = User.create(id: 20, name: "New user", email: "new_user@email.com", password: "Password123")
    visit '/'
    click_link 'Log In'
    fill_in "Email", with: "new_user@email.com"
    fill_in "Password", with: "Password123"
    click_button "Log in"
    visit '/users/20'
    click_link "Edit"
    fill_in "Password", with: "newpassword"
    click_button "Submit"
    click_link 'Log Out'
    click_link 'Log In'
    fill_in "Email", with: "new_user@email.com"
    fill_in "Password", with: "Password123"
    click_button "Log in"
    expect(page).to have_content "Invalid email/password combination"
 end

  scenario "Users can update their biography" do
    user = User.create(id: 20, name: "New user", email: "new_user@email.com", password: "Password123")
    visit '/'
    click_link 'Log In'
    fill_in "Email", with: "new_user@email.com"
    fill_in "Password", with: "Password123"
    click_button "Log in"
    visit '/users/20'
    click_link "Edit"
    fill_in "Biography", with: "I love TDD"
    click_button "Submit"
    expect(page).to have_content "I love TDD"
  end

  scenario "Users can update their image" do
    user = User.create(id: 20, name: "New user", email: "new_user@email.com", password: "Password123")
    visit '/'
    click_link 'Log In'
    fill_in "Email", with: "new_user@email.com"
    fill_in "Password", with: "Password123"
    click_button "Log in"
    visit '/users/20'
    click_link "Edit"
    attach_file('Avatar', 'spec/files/images/cat.jpg')
    click_button "Submit"
    expect(page).to have_xpath("//img[contains(@src, 'cat.jpg')]")
  end
end
