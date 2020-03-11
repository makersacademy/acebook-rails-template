require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit("/posts") # all pages redirect to sign_in b/c user isn't signed up
    click_link("Sign up") # go to sign_up
    fill_in "user_email", with: "test@example.com"
    fill_in "user_password", with: "example"
    click_button("Sign up")
    expect(current_path).to eq('/posts')
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
