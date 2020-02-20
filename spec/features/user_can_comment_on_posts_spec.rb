require 'rails_helper'

RSpec.feature 'Comment', type: :feature do
  scenario 'user can submit comment on a post' do
    sign_up
    new_post
    click_link 'Add Comment'
    fill_in 'comment[body]', with: 'First Comment'
    click_on 'Save'
    expect(page).not_to have_content('First Comment')
  end
end 