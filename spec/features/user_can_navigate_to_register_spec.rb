# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Registration', type: :feature do
  scenario 'You can press the button and go register' do
    visit('/')
    click_link('Register')
    expect(page).to have_content('Sign up')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
  end
end
