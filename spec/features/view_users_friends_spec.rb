# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'See list of users', type: :feature do
  scenario 'after clicking my friends button' do
    sign_up_2
    click_link 'Logout'
    sign_up
    click_link 'All Users'
    click_link 'Add friend'
    click_link 'Logout'
    sign_in_2
    click_link 'My Requests'
    click_link 'Accept'
    click_link 'Logout'
    sign_in
    click_link 'My friends'
    expect(page).to have_content('tome@test.com')
  end
end
