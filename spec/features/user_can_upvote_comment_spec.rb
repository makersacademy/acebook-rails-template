# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Comment", type: :feature do

  scenario "Users can like a comment" do
    visit('/')
    create_user
    login_user
    create_post
    visit('/posts')
    create_comment
    click_link 'Rabbit'
    expect(page).to have_content '1 - 0'
  end

  scenario "A user cannot add more than one upvote to a comment" do
    visit('/')
    create_user
    login_user
    create_post
    visit('/posts')
    create_comment
    click_link 'Rabbit'
    click_link 'Rabbit'
    expect(page).to have_content('1 - 0')
  end

  scenario "Additional users can add an upvote to a comment" do
    visit('/')
    create_user
    login_user
    create_post
    visit('/posts')
    create_comment
    click_link 'Rabbit'
    logout_user
    create_user_two
    login_user_two
    visit('/posts')
    click_link 'Rabbit'
    expect(page).to have_content('2 - 0')
  end

end
