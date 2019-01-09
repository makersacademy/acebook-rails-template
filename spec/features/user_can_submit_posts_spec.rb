require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can sign up with name email and pw" do
    visit "/users/sign_up"
    # click_link "New post"
    fill_in "Name", with: "tester"
    # fill_in "Name", with: "tester"
    # click_button "Submit"
    # expect(page).to have_content("Hello, world!")
  end
end
