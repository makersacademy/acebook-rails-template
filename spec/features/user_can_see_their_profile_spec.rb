require 'rails_helper'

RSpec.feature "User can view their profile", type: :feature do
  scenario 'successfuly' do
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: 'millie@gmail.com'
    fill_in "Firstname", with: "Jen"
    fill_in "Lastname", with: "Smith"
    fill_in "Password", with: "Secure123"
    fill_in "Password confirmation", with: "Secure123"
    click_button 'Sign up'
    click_link 'View profile'
    expect(page).to have_content("Type of Animal:")
    expect(page).to have_content("Age:")
    expect(page).to have_content("Owner:")
  end
end
