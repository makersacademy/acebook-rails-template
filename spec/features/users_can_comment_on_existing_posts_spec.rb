require 'rails_helper'

RSpec.feature 'Comments' do
  scenario 'user comments on existing post' do
    log_in_test_user
    Post.create()
    submit_post('A Test Post')
    fill_in 'Comment', with: 'Test Comment'
    click_on 'Comment'
    expect(page).to have_content 'Test Comment'
  end
end