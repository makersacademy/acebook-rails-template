# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signing out', type: :feature do
  scenario '- can sign out' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'sarah@test.com'
    fill_in 'Password', with: 'qwerty'
    fill_in 'Password confirmation', with: 'qwerty'
    click_button 'Sign up'
    click_link 'Log Out'

    visit '/'
    fill_in 'Email', with: 'sarah@test.com'
    fill_in 'Password', with: 'qwerty'
    click_button 'Log in'

    click_link 'Log Out'

    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
