
require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can delete posts from page by clicking delete' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, test delete!'
    click_button 'Submit'
    click_button 'Delete'
    expect(page).to have_no_content('Hello, test delete!')
  end
end