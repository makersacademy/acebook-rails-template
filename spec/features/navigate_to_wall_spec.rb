require 'rails_helper'

RSpec.feature "Walls", type: :feature do
  scenario "Can visit another user's wall" do
    signup
    click_on "logout"
    signup_user("Example", "Example@example.com", "password")
    click_on "user_index"
    expect(page).to have_content("Ben")
    expect(page).to have_content("Example")
    click_on "Ben"
    expect(current_path).to eq("/#{my_user_id('ben@example.com')}")
  end
end
