# frozen_string_literal: true

require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can update posts' do
    signup
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link '✏️'
    fill_in 'Message', with: 'Goodbye, world!'
    click_button 'Save changes'
    expect(page).to have_content('Goodbye, world!')
  end

  scenario "Cannot update other people's posts" do
    signup
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Log out'
    signup2
    expect(page).not_to have_content('✏️')
    visit '/posts/1/edit'
    click_button 'Save changes'
    expect(page).to have_content('Fuck off, this is not yours!')
  end
end
