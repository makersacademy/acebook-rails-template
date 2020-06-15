# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    signup
    visit '/posts'
    click_link 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    visit '/posts'
    expect(page).to have_content('Hello, world!')
  end
end
