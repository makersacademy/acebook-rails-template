# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signing In', type: :feature do
  scenario 'When a User visits root' do
    visit '/'
    expect(page).to have_content 'Log in'
  end
end
