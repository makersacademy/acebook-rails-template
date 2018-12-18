require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User can log in and can submit posts and view them" do
    visit "/signup"
    fill_in "user_first_name", with: 'first name'
    fill_in "user_last_name", with: 'last name'
    fill_in "user_email", with: 'test@email.com'
    fill_in "user_password", with: 'password'
    fill_in "user_password_confirmation", with: 'password'
    click_button "Sign up"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
