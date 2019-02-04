require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end
end

RSpec.feature 'Displays Timestamp', type: :feature do
  scenario 'Can view time message created' do
    post = Post.create('message' => 'Time')
    visit '/posts'
    expect(page).to have_content(post.created_at)
  end
end
