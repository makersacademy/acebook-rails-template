# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign-In', type: :feature do
  scenario 'A user can sign in' do
    register
    click_link 'Sign out'

    click_link 'Sign in'
    expect(page).to have_current_path('/users/sign_in')
    fill_in 'Email', with: 'email@example.com'
    fill_in 'Password', with: 'password123'
    click_button('Sign in')
    expect(page).to have_current_path('/')
    expect(page).to have_content('Hello, Katy')
  end
end
