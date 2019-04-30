# frozen_string_literal: true

feature 'Newest posts are shown first in list' do
  scenario 'Posts are displayed in reverse chronological order' do
    visit '/'
    sign_up_helper('user@test.com', '123456')
    log_in_helper('user@test.com', '123456')
    new_post_helper('First message')
    new_post_helper('Second message')
    new_post_helper('Third message')
    new_post_helper('Fourth message')
    expect(all('p')[0][:id]).to eq 'post-4'
    expect(all('p')[1][:id]).to eq 'post-3'
    expect(all('p')[2][:id]).to eq 'post-2'
    expect(all('p')[3][:id]).to eq 'post-1'
  end
end
