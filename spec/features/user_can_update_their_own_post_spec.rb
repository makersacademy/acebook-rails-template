require 'rails_helper'

RSpec.feature "Edit", type: :feature do
  scenario "A User can update their own post", js: true do
    sign_up_user
    make_post
    click_button "Edit"
    fill_in "edit_message", with: "(Changed) Lorem ipsum."
    find('#SaveUpdate').click
    expect(page).to_not have_content("Beep Beep")
    expect(page).to have_content("(Changed) Lorem ipsum.")
  end

  scenario "A User cannot update someone else's post" do
    sign_up_user
    make_post
    click_on "Logout"
    sign_up_second_user
    expect(page).to have_content("Beep beep")
    expect(page).to_not have_button("Edit")
  end
end
