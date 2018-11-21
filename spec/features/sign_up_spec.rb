require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  let(:user) { build(:user) }

  before do
    visit root_path
    find('a', text: 'Sign up').click
  end

  scenario 'user can navigate to sign up page' do
    expect(page).to have_current_path '/users/sign_up'
  end

  scenario 'user can sign up successfully' do
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
