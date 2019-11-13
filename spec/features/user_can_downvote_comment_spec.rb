# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Comment", type: :feature do

  scenario "Users can dislike a comment" do
    visit('/')
    create_user
    login_user
    visit('/posts')
    create_post
    create_comment
    click_link 'Snake'
    expect(page).to have_content 'Snake 1'
  end

  scenario "A user cannot add more than one dislike to a comment" do
    visit('/')
    create_user
    login_user
    visit('/posts')
    create_post
    create_comment
    click_link 'Snake'
    click_link 'Snake'
    expect(page).to have_content('Snake 1')
    expect(page).to have_content('Rabbit 0')
  end

  scenario "Additional users can add an dislike to a comment" do
    visit('/')
    create_user
    login_user
    visit('/posts')
    create_post
    create_comment
    click_link 'Snake'
    logout_user
    create_user_two
    login_user_two
    visit('/posts')
    click_link 'Snake'
    expect(page).to have_content('Snake 2')
    expect(page).to have_content('Rabbit 0')
  end

end
