# frozen_string_literal: true

require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Posts are shown in reverse chronological order' do
    signup
    click_link 'New post'
    fill_in 'Message', with: 'My first post!'
    click_button 'Submit'
    time_1 = Time.now
    click_link 'New post'
    fill_in 'Message', with: 'My second post!'
    click_button 'Submit'
    time_2 = Time.now

    expect(page).to have_content("My second post! Alfie #{time_2.strftime('%eth %b %Y %T')} ❌ ✏️  My first post! Alfie #{time_1.strftime('%eth %b %Y %T')} ❌ ✏️ ")
  end
end
