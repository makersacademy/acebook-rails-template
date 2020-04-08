require 'rails_helper'

RSpec.feature 'Users can sign up', type: :feature do
  scenario 'Can sign up for an account' do
    visit '/users/new'
    # click_button 'Sign Up' # move to homepage to re-direct here for sign up
    fill_in 'name', with: 'Ruby Rails'
    fill_in 'email', with: 'ruby@rails.com'
    fill_in 'password', with: 'Password'
    click_button 'Submit'
    expect(page).to have_content("Welcome to Acebook, Ruby Rails!")
  end
end


