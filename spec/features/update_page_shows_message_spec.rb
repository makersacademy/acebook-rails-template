# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can update a post from link' do
    sign_up
    visit '/posts'
    click_on('New post')
    fill_in 'Message', with: 'Hello, there!'
    click_button 'Submit'
    # save_and_open_page
    click_link 'Edit'
    # fill_in 'post[message]', with: 'Hello, there!'
    # click_button 'Update Post'
    fill_in 'post[message]', with: 'Hello, test!'
    click_button 'Update Post'
    expect(page).to have_content('Hello, test!')
  end
end
