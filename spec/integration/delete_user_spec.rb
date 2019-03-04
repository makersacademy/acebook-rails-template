require 'rails_helper'

RSpec.feature "Delete a user", type: :feature do
  scenario "A user can be deleted and posts/likes along with him" do
    Capybara.current_driver = :selenium
    visit '/'
    fill_in "user_email", with: "george.manyposts@gmail.com"
    fill_in "user_password", with: 'gm1234'
    click_on "Log in"
    expect(page).to have_content("A short post")
    click_on "Edit profile"
    accept_confirm do
      click_on "Cancel my account"
    end
    fill_in "user_email", with: "Percy.Onepost@gmail.com"
    fill_in "user_password", with: 'po1234'
    click_on "Log in"
    expect(page).not_to have_content("A short post")
  end
end
