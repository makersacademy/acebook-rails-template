# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'View user', type: :feature do
  scenario 'After clicking user link' do
    sign_up
    click_link('Logout')
    sign_up_2
    click_link('All Users')
    click_link('james@test.com')
    expect(current_path).to include('/users/')
    expect(page).to have_content('james@test.com')
  end
end
