# frozen_string_literal: true

require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Registration', type: :feature do
  scenario 'Can successfully register as a user' do
    signup
    expect(page).to have_content('Welcome to Acebook Alfie')
  end
end
