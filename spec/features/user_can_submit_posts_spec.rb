# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    sign_up
    post_message
    expect(page).to have_content('Hello, World!')
  end

  scenario 'user see the post with a date/time stamp' do
    sign_up
    post_message
    expect(page).to have_content('24 April 2019, 12:00am')
  end

end
