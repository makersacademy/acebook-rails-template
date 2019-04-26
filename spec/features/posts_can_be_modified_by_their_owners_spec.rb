# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Editing posts", type: :feature do
  scenario "An 'edit' link should appear on a user's post" do
    sign_up
    create_post
    expect(page).to have_link('Edit')
  end

  scenario "An 'edit' link should not appear on a different user's post" do
    sign_up email: 'user1@gmail.com'
    create_post
    sign_up email: 'user2@gmail.com'
    visit '/posts'
    expect(page).not_to have_link('Edit')
  end

  scenario "The edit link should go to the edit page for the post" do
    sign_up
    create_post
    click_link 'Edit'
    expect(page).to have_content('Edit post')
  end

  scenario "Users can edit posts from the edit post page" do
    sign_up
    create_post message: "My first post"
    click_link 'Edit'
    fill_in "Message", with: "My edited post"
    click_on "Submit"
    expect(page).not_to have_content("My first post")
    expect(page).to have_content("My edited post")
  end

  scenario "Users can't edit other users' posts" do
    user = User.create(email: 'my@email.com', password: '123456')
    post = Post.create(message: 'my message', user_id: user.id)

    sign_up
    visit "/posts/#{post.id}/edit"
    expect(page).to have_content "You can't edit that post!"
  end
end
