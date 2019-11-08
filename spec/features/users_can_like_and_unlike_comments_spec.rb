require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User can submit comments and then like comments once" do
    signup_as_new_user("James")
    login_as_user("James")
    create_new_post("Hello, world!")
    fill_in "comment[text]", with: "Great post!"
    click_button "Save Comment"
    expect(page).to have_content("Great post!")
    expect(page).to have_link "Lick"
    click_link "Lick"
    expect(page).to have_content("1 licks")
    # expect(page).to have_content("0 licks")
    expect(page).not_to have_link "Lick"
  end

  scenario "User can like comments then unlike the comment" do
    signup_as_new_user("James")
    login_as_user("James")
    create_new_post("Hello, world!")
    fill_in "comment[text]", with: "Great post!"
    click_button "Save Comment"
    expect(page).to have_content("Great post!")
    expect(page).to have_link "Lick"
    click_link "Lick"
    expect(page).to have_content("1 licks")
    # expect(page).not_to have_content("0 licks")
    # expect(page).to have_content("0 licks")
    expect(page).not_to have_link "Lick"
    expect(page).to have_link "Unlick"
    click_link "Unlick"
    expect(page).to have_content("0 licks")
  end
end
