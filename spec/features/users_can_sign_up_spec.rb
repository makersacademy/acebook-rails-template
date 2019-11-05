require 'rails_helper'

RSpec.feature 'Sign Up' do
  scenario 'user creates an account' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'test@user.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Logged in as test@user.com'
  end
end
