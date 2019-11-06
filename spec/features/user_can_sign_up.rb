require 'rails_helper'

RSpec.feature "sign up", type: :feature do
  scenario "user signs up sucessfully" do
    signup_as_new_user("Duncan")
    expect(current_path).to eq("/")
  end

  scenario "users creating account with duplicate username throws error message" do
    signup_as_new_user("Duncan")
    signup_as_new_user("Duncan")
    expect(current_path).to eq("/signup")
    expect(page).to have_content("Username already taken")
  end
end
