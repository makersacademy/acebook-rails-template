# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'Send friend request', type: :feature do
  scenario 'from the user profile page' do
    sign_up
    click_link('Logout')
    sign_up_2
    click_link('All Users')
    click_link('james@test.com')
    click_link('Add friend')
    expect(current_path).to include('/users')
    expect(page).to have_content('You have sent james@test.com a friend request!')
  end
end
