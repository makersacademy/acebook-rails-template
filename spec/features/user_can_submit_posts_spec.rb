# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Posts are shown in order of creation' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'I am second'
    click_button 'Submit'
    click_link 'New post'
    fill_in 'Message', with: 'I am first'
    click_button 'Submit'
    expect(page.all('p')[0]).to have_content 'I am first'
  end
end
