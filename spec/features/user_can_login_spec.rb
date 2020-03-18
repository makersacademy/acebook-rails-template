require 'rails_helper'

RSpec.feature "Log in", type: :feature do
  scenario "User can log in" do
    sign_up
    click_on "Log out"
    expect(current_path).to eq('/login')
    expect(page).to have_content('Please log in!')
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    expect(current_path).to eq('/posts/yours')
    expect(page).to have_content('You have successfully logged in!')
  end
end
