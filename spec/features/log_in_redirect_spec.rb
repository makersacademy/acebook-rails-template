# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Log in', type: :feature do
  scenario 'redirects a user to /posts after logging in' do
    sign_up
    expect(page).to have_content('New post')
  end
end
