# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signing in', type: :feature do
  scenario '- can sign in' do
    signing_up
    click_link 'Log Out'

    visit '/'
    fill_in 'Email', with: 'sarah@test.com'
    fill_in 'Password', with: 'qwerty'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
  end
end
