require 'rails_helper'

RSpec.feature "User can return to newsfeed from profile", type: :feature do
  scenario 'successfuly' do
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: 'tinathetuna@gmail.com'
    fill_in "Firstname", with: "Tina"
    fill_in "Lastname", with: "Bubbles"
    fill_in "Password", with: "sushih8er"
    fill_in "Password confirmation", with: "sushih8er"
    click_button 'Sign up'
    click_link 'View profile'
    click_link 'Newsfeed'
    expect(page).to have_content("Message")
  end
end
