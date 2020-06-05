require 'rails_helper'

RSpec.feature 'Update Post', type: :feature do
  scenario 'User able to update post' do
    visit '/posts'

    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'

    click_button 'Update Post'
    fill_in 'Message', with: 'New Message!'
    click_button 'Submit'

    expect(page).to_not have_content('Hello, world!')
    expect(page).to have_content('New Message!')
  end
end