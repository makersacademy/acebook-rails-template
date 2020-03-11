require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit("/posts") # should redirect to login
    click_button("Sign up")
    fill_in "user_email", with: "test@example.com"
    fill_in "user_password", with: "example"
    fill_in "user_password_confirmation", with: "example"
    click_button("Sign up")
    expect(current_path).to eq('/posts')
    # visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
