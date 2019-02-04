require 'rails_helper'
require_relative '../helpers/users_helper_spec'

RSpec.feature 'Sign out', type: :feature do
  scenario 'User can sign out after signing in' do
    fill_in_sign_up_details
    click_button 'Sign Up'
    visit '/'
    fill_in :sign_in_email, with: 'davethecat@katze.com'
    fill_in :sign_in_password, with: 'Gato123'
    click_button 'Sign In'
    click_on 'Sign Out'
    expect(page.current_path).to eq '/'
    expect(page).to have_content("You are now signed out")
  end

  scenario 'User can sign out after signing up' do
    fill_in_sign_up_details
    click_button 'Sign Up'
    click_on 'Sign Out'
    expect(page.current_path).to eq '/'
    expect(page).to have_content("You are now signed out")
  end
end
