# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'View Requests', type: :feature do
  scenario 'After clicking my requests' do
    sign_up
    click_link('Logout')
    sign_up_2
    click_link('All Users')
    click_link('Add friend')
    click_link('Logout')
    sign_in
    click_link('My Requests')
    expect(current_path).to include("/friend_requests")
    expect(page).to have_content("tome@test.com")
  end
end
