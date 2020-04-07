require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/users/sign_up"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "testtest"
    fill_in "user_password_confirmation", with: "testtest"
    click_button "Sign up"
    click_link "New post"
    fill_in 'post_message', with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
