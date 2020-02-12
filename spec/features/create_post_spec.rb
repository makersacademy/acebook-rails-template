require 'rails_helper'

RSpec.feature 'Users can create a post', type: :feature do
  scenario 'User creates a post' do
    visit '/posts'
    click_on 'New Post'
    fill_in 'post[post_content]', with: 'Hey there'
    click_on 'Create Post'
    expect(page).to have_content('Hey there')
  end
end
