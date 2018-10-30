# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can visit website and Sign up' do
    signup
    upload_image
    click_link 'My Profile'
    expect(page).to have_content('my logo')
  end
end
