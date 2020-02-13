# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign in', type: :feature do
  scenario 'can sign in' do
    sign_up
    click_on 'Sign out'
    visit '/'
    fill_in 'user[email]', with: 'ria@testing.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end
end
