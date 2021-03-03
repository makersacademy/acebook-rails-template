require 'rails_helper'
require 'web_helpers'


RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: DEFAULT_POST
    click_button 'Submit'
    expect(page).to have_content(DEFAULT_POST)
  end

  scenario 'Can delete own post' do
    sign_up
    create_post
    click_on 'Move to recycle bin'
    expect(page).not_to have_content(DEFAULT_POST)
  end

  scenario "Don't see delete button on others posts" do
    sign_up
    create_post
    click_on 'Sign out'
    sign_up(SECONDARY_EMAIL, SECONDARY_PASSWORD)
    expect(page).not_to have_content('Move to recycle bin')
  end

  scenario "User can edit own posts" do
    sign_up
    create_post
    click_on 'Edit post'
    fill_in 'Message', with: SECONDARY_POST
    click_on 'Submit'
    expect(page).to have_content(SECONDARY_POST)
  end

  scenario "User cannot edit a different user's post" do
    sign_up
    create_post
    click_on 'Sign out'
    sign_up(SECONDARY_EMAIL, SECONDARY_PASSWORD)
    post = Post.last
    id = post.id
    visit "/posts/#{id}/edit?"
    expect(page).to have_content("That is not your post")
  end

end
