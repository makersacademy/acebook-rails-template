require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  scenario 'user comments on existing post' do
    log_in_test_user
    # Post.create()
    submit_post('A Test Post')
    fill_in 'comment_message', with: 'Test Comment'
    click_on 'Add comment'
    expect(page).to have_content 'Test Comment'
  end
end
