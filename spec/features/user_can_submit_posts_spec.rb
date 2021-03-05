require 'rails_helper'
require 'web_helpers'


RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    sign_up
    find('.add-post').click
    fill_in 'Message', with: DEFAULT_POST
    click_button 'Submit'
    expect(page).to have_content(DEFAULT_POST)
  end

  scenario 'Can delete own post' do
    sign_up
    create_post
    find("#delete-post").click
    expect(page).not_to have_content(DEFAULT_POST)
  end

  scenario "Don't see delete button on others posts" do
    sign_up
    create_post
    click_on 'Sign out'
    sign_up(SECONDARY_EMAIL, SECONDARY_PASSWORD)
    expect(page).not_to have_css('#delete-post')
  end

  scenario "User can edit own posts" do
    sign_up
    create_post
    find("#edit-post").click
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

  scenario "Can only edit post within 10min of creation" do
    sign_up
    create_post
    allow(Time).to receive(:now).and_return(Post.last.created_at + 20.minutes)
    expect(page).not_to have_content "Edit post"
  end

  scenario "Can't try to cheat to edit an old post'" do
    sign_up
    create_post
    allow(Time).to receive(:now).and_return(Post.last.created_at + 20.minutes)
    # allow(Post.last).to receive(:created_at).and_return(Time.now - 20.minutes)
    # p Time.now
    # p Post.last.created_at
    post = Post.last
    id = post.id
    visit "/posts/#{id}/edit?"
    expect(page).to have_content "You can no longer edit this post"
    expect(current_path).to eq "/posts"
  end

end
