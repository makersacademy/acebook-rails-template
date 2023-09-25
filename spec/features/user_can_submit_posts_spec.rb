require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  scenario "Can submit posts and view them" do

    user = FactoryBot.create(:user) # Create a user using FactoryBot

    # Sign in the user through the interface using Capybara
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
