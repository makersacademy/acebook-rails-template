require 'rails_helper'

RSpec.feature 'Editing Comment', type: :feature do
  scenario 'making a comment' do
    sign_in_and_create_post
    click_link 'Comment'
    fill_in 'comment[body]', with: 'A comment'
    click_button('Comment')
    within('#amend-comment') do
      click_link 'Edit'
    end
    fill_in 'comment[body]', with: 'An edited comment'
    click_button('Update Comment')
    expect(page).to have_content('An edited comment')
  end
end
