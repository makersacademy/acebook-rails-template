require 'rails_helper'

RSpec.feature "View Your Posts", type: :feature do
  scenario "new user can't see posts on their page" do
    visit "/users/new"
    fill_in "Email", with: "posttest@example.com"
    fill_in "Password", with: "passw0rd"
    click_button "Submit"
    expect(page).to have_content("You have no posts... :(")
    expect(page).not_to have_content("Email")
  end
end
