require 'rails_helper'

RSpec.feature 'Likes' do
  scenario 'user likes a comment' do
    log_in_test_user
    submit_post('test post')
    fill_in 'comment[message]', with: 'test comment'
    click_on 'Add comment'
    first('.comment').click_on('like')
    expect(page).to have_content('unlike')
  end
  
  scenario 'user unlikes a comment' do
    log_in_test_user
    submit_post('test post')
    fill_in 'comment[message]', with: 'test comment'
    click_on 'Add comment'
    first('.comment').click_on('like')
    first('.comment').click_on('unlike')
    expect(page).not_to have_content('unlike')
    expect(page).to have_content('like')
  end
end
