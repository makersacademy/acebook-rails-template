# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign out', type: :feature do
  scenario 'A user can sign up' do
    sign_up
    click_link 'Sign out'
    expect(page).to have_content('Sign in')
  end
end
