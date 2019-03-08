require 'rails_helper'

RSpec.feature "Journey", type: :feature do
  scenario "can sign up, post, see his post, log out, log in, see his previous post" do
    visit '/'
    click_link("Sign up", match: :first)
    fill_in "user_email", with: "featuretest@email.com"
    fill_in "user_first_name", with: 'feature'
    fill_in "user_last_name", with: 'test'
    fill_in "user_password", with: "featurepwd"
    fill_in 'user_password_confirmation', with: "featurepwd"
    click_on "Submit"
    expect(page).to have_content('Logged in')
    expect(page).to have_content('Message')
    fill_in "post_message", with: "test feature message"
    click_on "Submit"
    expect(page).to have_content("test feature message")
    click_link "Logout"
    expect(page).to have_content("Login")
    fill_in 'user_email', with: 'featuretest@email.com'
    fill_in 'user_password', with: 'featurepwd'
    click_on "Log in"
    expect(page).to have_content("test feature message")
  end
end
