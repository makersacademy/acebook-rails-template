require "rails_helper"

RSpec.feature "format post", type: :feature do
  scenario "Postsshould be formatted with line breaks" do
    visit "/users/sign_up"
    fill_in "user[email]", with: "test@gmail.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button "Sign up"
    click_link "New post"
    fill_in "Message", with: "Hello, world
    this is a new line"
    click_button "Submit"
    expect(html).to include("br")
  end

  # scenario "If a user visits any page without signing in you are directed to sign up" do
  # end
end
