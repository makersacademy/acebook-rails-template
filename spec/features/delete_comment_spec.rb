require 'rails_helper'

RSpec.feature 'Editing Comment', type: :feature do
  scenario 'making a comment' do
    sign_in_and_create_post
    click_link 'Comment'
    fill_in 'comment[body]', with: 'A comment'
    click_button('Comment')
    click_link 'Destroy comment'
    expect(page).not_to have_content('A comment')
  end
end
