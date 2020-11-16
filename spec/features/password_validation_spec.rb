require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can receive a password too short warning" do
    visit "/signup"
    fill_in "user[username]", with: "testuser"
    fill_in "user[email]",	with: "test@test.com"
    fill_in "user[password]",	with: "test"
    fill_in "user[password_confirmation]",	with: "test"
    click_on('Create User')
    expect(page).to have_content("Password is too short (minimum is 8 characters)")
  end
  scenario "Can receive a password needs a least one captial " do
    visit "/signup"
    fill_in "user[username]", with: "testuser"
    fill_in "user[email]",	with: "test@test.com"
    fill_in "user[password]",	with: "test"
    fill_in "user[password_confirmation]",	with: "test"
    click_on('Create User')
    expect(page).to have_content("Password must contain at least 1 uppercase")
  end
  scenario "Can receive a password needs at least one number" do
    visit "/signup"
    fill_in "user[username]", with: "testuser"
    fill_in "user[email]",	with: "test@test.com"
    fill_in "user[password]",	with: "test"
    fill_in "user[password_confirmation]",	with: "test"
    click_on('Create User')
    expect(page).to have_content("Password must contain at least one number")
  end
  scenario "Password confimation does not match" do
    visit "/signup"
    fill_in "user[username]", with: "testuser"
    fill_in "user[email]",	with: "test@test.com"
    fill_in "user[password]",	with: "test"
    fill_in "user[password_confirmation]",	with: "tesft"
    click_on('Create User')
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end