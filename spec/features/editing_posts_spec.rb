require 'rails_helper'

RSpec.feature 'Editing posts', type: :feature do
  scenario 'users can edit existing posts' do
    add_new_post
    click_link 'Edit'
    fill_in 'post[message]', with: 'Rails is awesome'
    click_button 'Submit'
    expect(page).not_to have_content 'Hello, world!'
    expect(page).to have_content 'Rails is awesome'
  end
end
