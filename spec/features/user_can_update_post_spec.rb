# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can edit posts and view them' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello world!!'
    click_button 'Submit'
    click_link('edit_post')
    fill_in 'new_message', with: "I'm updated"
    click_button 'Submit'
    expect(page).to have_content("I'm updated")
    expect(page).not_to have_content('Hello, world!')
  end
end
