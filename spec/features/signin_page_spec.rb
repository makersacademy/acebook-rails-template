# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'Sign in', type: :feature do
  scenario 'User is at sign in page' do
    sign_up
    click_link('Logout')
    sign_in
    expect(page).to have_content 'Feel the force.'
    expect(page).to have_content 'Logged in as james@test.com.'
  end

  scenario 'Log in and redirected to posts page' do
    sign_up
    post_message
    click_link('Logout')
    sign_in
    expect(page).to have_content 'Hello, World!'
  end
end
