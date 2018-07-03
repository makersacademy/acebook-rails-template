require 'rails_helper'

RSpec.feature "User creates an account", type: :feature do
  scenario 'successfuly' do
    visit root_path
    click_link "Create new account"
    fill_in "Email", with: 'millie@gmail.com'
    fill_in "Name", with: "Millie"
    fill_in "Password", with: "Secure123"
    fill_in "Confirm password", with: "Secure123"
    click_button 'Submit'
    expect(page).to have_content("You've created an account!")
  end
end
