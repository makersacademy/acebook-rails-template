require 'rails_helper'

RSpec.feature 'Comment', type: :feature do
  scenario 'user can submit comment on a post' do
    sign_up
    new_post
    fill_in 'comment[body]', with: 'First Comment'
    click_link 'Add Comment'
    expect(page).not_to have_content('First Comment')
  end
end 