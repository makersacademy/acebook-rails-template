require 'rails_helper'

RSpec.feature "Delete a user", type: :feature do
  scenario "A user can be deleted and posts along with him" do
    Capybara.current_driver = :selenium
    login_george_manyposts
    expect(page).to have_content("A short post")
    click_on "Edit profile"
    accept_confirm do
      click_on "Cancel my account"
    end
    login_percy_onepost
    expect(page).not_to have_content("A short post")
  end

  scenario "A user can be deleted and likes along with him" do
    Capybara.current_driver = :selenium
    login_percy_onepost
    expect(page).not_to have_content("1 Like")
    click_on("Like", match: :first)
    expect(page).to have_content("1 Like")
    click_on "Edit profile"
    accept_confirm do
      click_on "Cancel my account"
    end
    login_sarah_fewposts
    expect(page).not_to have_content("1 Like")
  end
end
