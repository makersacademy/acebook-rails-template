require 'rails_helper'
require 'simple_send_keys'
RSpec.feature 'user signs in', type: :feature, js: true do
  scenario 'user gets error message when signing in with invalid details' do
    User.create(email: 'tester@test.com', password: 'password123')
    visit('/')
    fill_in('user_email', with: 'tester@test.com')
    fill_in('user_password', with: 'password')
    click_button 'Log in'
    expect(page.current_path).to eq '/users/sign_in'
    expect(page).to have_content('Invalid Email or password.')
  end
end
