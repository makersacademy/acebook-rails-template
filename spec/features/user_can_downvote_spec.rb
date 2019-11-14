# # frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Votes", type: :feature do
  scenario "Can downvote posts" do
    visit('/')
    create_user
    login_user
    create_post
    visit('/posts')
    click_link 'Badger'
    expect(page).to have_content('0 - 1')
  end

  scenario "A user cannot add more than one downvote to a post" do
    visit('/')
    create_user
    login_user
    create_post
    visit('/posts')
    click_link 'Badger'
    click_link 'Badger'
    expect(page).to have_content('0 - 1')
  end

  scenario "Additional users can add a downvote to a post" do
    visit('/')
    create_user
    login_user
    create_post
    visit('/posts')
    click_link 'Badger'
    logout_user
    create_user_two
    login_user_two
    visit('/posts')
    click_link 'Badger'
    expect(page).to have_content('0 - 2')
  end
end
