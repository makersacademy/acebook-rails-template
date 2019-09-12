require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can edit posts and view them' do
    # TODO: add login helper method
    sign_in
    visit '/posts'
    click_button 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_button 'Edit Post'
    fill_in 'Message', with: 'Hello, Dream world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, Dream world!')
  end
end
