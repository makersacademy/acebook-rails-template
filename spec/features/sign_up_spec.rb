require 'rails_helper'
require 'sign_up_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "User not signed up and are redirect if they try to visit another URL" do
    visit "/posts"
    expect(page).to have_content("Sign up")
  end

  scenario "User prompted to sign up with email address and password" do
    visit "/"
    click_link "Sign up"
    expect(page).to have_field("user_email")
    expect(page).to have_field("user_password")
    expect(page).to have_field("user_password_confirmation")
  end
end
