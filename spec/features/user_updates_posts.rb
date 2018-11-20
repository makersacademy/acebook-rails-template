# frozen_string_literal: true

require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can update posts' do
    signup
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button '✏️'
    fill_in 'Message', with: 'Goodbye, world!'
    click_button 'Save changes'
    expect(page).to have_content('Goodbye, world!')
  end
end
