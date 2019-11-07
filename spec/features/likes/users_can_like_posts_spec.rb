require 'rails_helper'

RSpec.feature 'Likes' do
  scenario 'user likes a post' do
    log_in_test_user
    submit_post('test post')
    click_on 'like'
    expect(page).to have_content('unlike')
  end
  scenario 'user unlikes a post' do
    log_in_test_user
    submit_post('test post')
    click_on 'like'
    click_on 'unlike'
    expect(page).not_to have_content('unlike')
    expect(page).to have_content('like')
  end
end