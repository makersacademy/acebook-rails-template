require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "redirects to index if not signed up" do
    visit "/"

    click_link "New post"

    expect(page).to_not have_content("Message")
    expect(page).to have_content("Sign up")
  end

  scenario "can enter an email and password" do
    visit "/users/sign_up"

    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"

    click_button "Sign up"

    expect(page).to have_content("Sign Out")
  end
end
