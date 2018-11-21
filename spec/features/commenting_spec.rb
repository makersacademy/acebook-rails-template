require 'rails_helper'

RSpec.feature 'Commenting', type: :feature do
  scenario 'making a comment' do
    sign_in_and_create_post
    click_link 'Comment'
    fill_in 'comment[body]', with: 'A comment'
    click_button('Comment')
    expect(page).to have_content('A comment')
  end
end
