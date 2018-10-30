# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can visit website and Sign up' do
    signup
    click_link 'My Profile'
    fill_in 'post_message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'My Profile'
    expect(page).to have_content('Hello, world!')
  end
end
