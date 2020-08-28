require 'rails_helper'

RSpec.feature 'creating posts', type: :feature do
  scenario 'user can create posts' do
    sign_up
    click_link 'See Posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'Test content'
    click_button 'Submit'
    expect(page).to have_content('Test content')
  end
end
RSpec.feature 'deleting posts', type: :feature do
  scenario 'user can delete posts' do
    sign_up
    click_link 'See Posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'Test content'
    click_button 'Submit'
    first(:link, 'Delete').click
    expect(page).not_to have_content('Test content')
  end
end
