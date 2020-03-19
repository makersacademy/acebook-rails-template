require 'rails_helper'

RSpec.feature "Log in", type: :feature do
  scenario "User can log in" do
    sign_up
    click_on "Log out"
    expect(current_path).to eq('/login')
    expect(page).to have_content('Please log in!')
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Submit"
    expect(current_path).to eq('/posts/yours')
    expect(page).to have_content('Log in successful!')
  end

  scenario "Log in fails with unregistered email" do
    sign_up
    click_on "Log out"
    fill_in "Email", with: "wrong@example.com"
    fill_in "Password", with: "password"
    click_button "Submit"
    expect(current_path).to eq('/login')
    expect(page).to have_content('Invalid email/password combination')
  end

  scenario "Log in fails with wrong password" do
    sign_up
    click_on "Log out"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "wrongword"
    click_button "Submit"
    expect(current_path).to eq('/login')
    expect(page).to have_content('Invalid email/password combination')
  end
end
