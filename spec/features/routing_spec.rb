require "rails_helper"

RSpec.feature "Routing", type: :feature do
  scenario "After signing in visiting '/' direct to 'user/posts'" do
    visit "/users/sign_up"
    fill_in "user[email]", with: "test@gmail.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button "Sign up"
    visit "/"
    expect(page).to have_content("New post")
  end

  # scenario "If a user visits any page without signing in you are directed to sign up" do
  # end
end