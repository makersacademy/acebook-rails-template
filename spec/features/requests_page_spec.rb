# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'Accept Requests', type: :feature do
  scenario 'Accept from request page' do
    sign_up
    click_link('Logout')
    sign_up_2
    click_link('All Users')
    click_link('james@test.com')
    click_link('Add friend')
    click_link('Logout')
    sign_in
    click_link('My Requests')
    click_link('Accept')
    expect(current_path).to include("/friend_requests")
    expect(page).to have_content("You have accepted a friend request from tome@test.com")
  end
end
