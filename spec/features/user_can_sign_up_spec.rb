require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can sign up got Acebook" do
    visit "/"
    click_link "Register"
    fill_in "user[email]", with: "mac@gmail.com"
    fill_in "user[password]", with: "123456"
    click_button('Submit')
    expect(page).to have_content("User successfully registered")
  end
  scenario "user can't register twice with the same email" do
    visit "/"
    click_link "Register"
    fill_in "user[email]", with: "mac@gmail.com"
    fill_in "user[password]", with: "123456"
    click_button('Submit')
      click_link "Register"
    fill_in "user[email]", with: "mac@gmail.com"
    fill_in "user[password]", with: "123456"
    click_button('Submit')
    expect(page).to have_content("User already exists")

  end

end
