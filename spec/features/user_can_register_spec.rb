require 'rails_helper'

RSpec.feature "Register account", type: :feature do
  scenario "user can sign up" do
    visit "/users"
    click_link "sign up page"
    fill_in "user_username", with: "Lotty"
    fill_in "user_password", with: "Password12"
    click_button "Submit"
    expect(page).to have_content("You have signed up")
  end
end

RSpec.feature "Invalid sign up", type: :feature do
  scenario "no username" do
    visit "/users"
    click_link "sign up page"
    fill_in "user_password", with: "Password12"
    click_button "Submit"
    expect(page).to have_content("Validation failed: Username can't be blank")
  end

  scenario "no password" do
    visit "/users"
    click_link "sign up page"
    fill_in "user_username", with: "Lotty"
    click_button "Submit"
    expect(page).to have_content("Validation failed: Password can't be blank")
  end

end