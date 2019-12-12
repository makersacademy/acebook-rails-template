require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/users/sign_up"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign up"
    click_on "New post"
    fill_in "Message", with: "Hello, world!"
    click_on "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
