require 'rails_helper'

RSpec.feature "Edit", type: :feature do
  scenario "Can edit posts" do
    visit('/')
    create_user
    login_user
    create_post
    click_link 'Edit'
    expect(page).to have_content('Edit Post')
  end

  scenario "Can edit posts and view them" do
    visit('/')
    create_user
    login_user
    create_post
    click_link 'Edit'
    fill_in "post[message]", with: "I am edited."
    click_button 'Update Post'
    expect(page).to have_content("I am edited.")
    expect(page).not_to have_content("Hello, world!")
  end

  scenario "Can edit post and view with line breaks" do
    visit('/')
    create_user
    login_user
    create_post
    click_link 'Edit'
    fill_in "post[message]", with: "Hello, world!\nI am edited.\nI'm on a new line."
    click_button 'Update Post'
    expect(page).to have_content("Hello, world!\nI am edited.\nI'm on a new line.")
  end

  scenario "Cannot edit a post by another user" do
    visit('/')
    create_user
    login_user
    create_post
    logout_user
    create_user_two
    login_user_two
    visit('/posts')
    click_link 'Edit'
    expect(page).to have_content("Sorry! You can't edit someone else's post.")
    expect(page).to have_content('Hello, world!')
  end

  # scenario "Edit button not visible after 10 minutes and page refresh" do
  #   pending
  #   visit('/')
  #   create_user
  #   login_user
  #   create_post
  #   Timecop.freeze(Time.now + 601.seconds)
  #   visit current_path
  #   expect(page).not_to have_link("Edit")
  #   expect(page).to have_content('Hello, world!')
  # end

  scenario "Posts cannot be edited after 10 minutes" do
    pending
    visit('/')
    create_user
    login_user
    create_post
    Timecop.freeze(Time.now + 601.seconds)
    click_link 'Edit'
    expect(page).to have_content('10 minutes exceeded: you can no longer edit the post.')
    expect(page).to have_content('Hello, world!')
  end
end
