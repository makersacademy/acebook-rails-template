require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can sign up' do
    visit '/posts'
    click_link 'Sign Up'
    expect(page).to have_current_path('/users/sign_up')
    # fill_in "username_textbox", with: "username123"
    fill_in 'user[email]', with: 'user@user.com'
    fill_in 'user[password]', with: 'pword123'
    fill_in 'user[password_confirmation]', with: 'pword123'
    click_button 'Sign up'
    expect(page).to have_content('Log Out from user@user.com')
  end
end
