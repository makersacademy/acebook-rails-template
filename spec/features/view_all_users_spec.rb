# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'View users', type: :feature do
  scenario 'After clicking all-users' do
    sign_up
    click_link('Logout')
    sign_up_2
    click_link('All Users')
    expect(page).to have_content('james@test.com')
    expect(current_path).to eq('/users')
  end
end



