require 'rails_helper'

RSpec.feature "Post", type: :feature do
  scenario "Username appears on post" do
    sign_up_user
    visit "/"
    click_link "New post"
    fill_in "Message", with: "I own 51% of this company!"
    click_button "Submit"
    expect(page).to have_content("Amy Ace said: I own 51% of this company!")
  end
end