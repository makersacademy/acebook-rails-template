# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can visit website and Sign up' do
    signup
    expect(page).to have_content('Logout')
  end
end
