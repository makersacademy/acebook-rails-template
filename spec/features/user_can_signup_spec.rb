require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can sign up" do
    visit '/posts'
    click_link 'Sign Up'
    expect(page).to have_current_path("/users/sign_up")
    # fill_in "username_textbox", with: "username123"
    fill_in "field[:email]", with: "user@user.com"
    fill_in "password", with: "pword123"
    fill_in "password_confirmation", with: "pword123"
    click_button "Sign up"
    expect(page).to have_content("Logged in as username123")
  end

end
