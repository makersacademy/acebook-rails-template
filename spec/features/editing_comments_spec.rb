require 'rails_helper'

RSpec.feature 'Editing comments', type: :feature do
  scenario 'users can edit an existing comment' do
    add_new_post
    add_comment
    click_link 'Edit Comment'
    fill_in 'comment[commenter]', with: 'Charlene'
    fill_in 'comment[body]', with: 'Makers is great'
    click_button 'Submit'
    expect(page).to have_content 'Makers is great'
    expect(page).not_to have_content 'Rails is awesome'
  end
end
