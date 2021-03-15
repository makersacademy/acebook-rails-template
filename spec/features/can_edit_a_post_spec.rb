# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can edit posts' do
    sign_up
    create_post
    click_link 'Edit'
    fill_in 'Message', with: 'I am here!'
    click_button 'Submit'
    expect(page).not_to have_content('Hello, world!')
    expect(page).to have_content('I am here!')
  end
end
