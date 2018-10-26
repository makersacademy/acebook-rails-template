# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Landing Page', type: :feature do
  scenario 'When a User visits root' do
    visit '/'
    expect(page).to have_content "Log in"
  end
end