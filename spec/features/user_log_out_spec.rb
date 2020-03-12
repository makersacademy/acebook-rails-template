require 'rails_helper'

RSpec.feature "User log out", type: :feature do
  scenario "User can log out" do
    user_sign_up

    expect(page).to have_content("Logout")
  end
end