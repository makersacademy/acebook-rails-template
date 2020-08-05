require 'rails_helper'

RSpec.feature 'Signup', type: :feature do
  scenario 'Can submit a post' do
    visit '/people/sign_in'
    fill_in 'email', with: 'bob@yahoo.com'
    fill_in 'password', with: 'password123'
    click_button 'Sign up'
    expect(page).to have_content("You've successfully signed up with bob@yahoo.com")
  end
end