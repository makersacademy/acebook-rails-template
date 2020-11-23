require 'rails_helper'
RSpec.feature "Sign up", type: :feature do
  scenario "Can sign up" do
    add_new_user
    expect(page).to have_content("Test Person")
  end

  scenario "Can't sign up twice" do
    add_new_user
    click_button('Log Out')
    add_new_user
    expect(page).to have_content("User already exists. Please log in.")
  end
end

