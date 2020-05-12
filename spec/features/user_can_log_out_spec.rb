require 'rails_helper'

RSpec.feature "Log-out", type: :feature do
  scenario "User can log out" do
    User.create(name: "Gina", password: "123456", email: "gina@example.com")
    visit "/sessions/new"
    fill_in "session[name]", with: "Gina"
    fill_in "session[password]", with: "123456"
    click_on "Log in"
    click_on "Log out"
    expect(page).to have_current_path "/sessions/new"
  end
end