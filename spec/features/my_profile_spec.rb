# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'My profile', type: :feature do
  scenario 'I want the posts page to have a button to take me to my profile' do
    sign_up_helper('user@test.com', '123456')
    log_in_helper('user@test.com', '123456')
    expect(page).to have_button('Go to my profile')
  end

  scenario 'i want the "go to my profile" button to take me to my profile' do
    sign_up_helper('user@test.com', '123456')
    log_in_helper('user@test.com', '123456')
    click_button('Go to my profile')
    expect(page).to have_content('My profile')
  end

  scenario 'I want to see a list of posts in the user profile' do
    sign_up_helper('user@test.com', '123456')
    log_in_helper('user@test.com', '123456')
    new_post_helper("It's almost Friday!!")
    click_button('Go to my profile')
    expect(page).to have_content("It's almost Friday!!")
    expect(page).to_not have_button('Go to my profile')
  end

  scenario 'I want to only see my posts in the user profile' do
    sign_up_helper('user1@test.com', '123456')
    log_in_helper('user1@test.com', '123456')
    new_post_helper("It's almost Friday!!")
    click_button('Log out')

    sign_up_helper('user2@test.com', '123456')
    log_in_helper('user2@test.com', '123456')
    new_post_helper("It's not Monday!!")
    expect(page).to have_content("It's almost Friday!!")
    expect(page).to have_content("It's not Monday!!")

    click_button('Go to my profile')
    expect(page).to have_content("It's not Monday!!")
    expect(page).to_not have_content("It's almost Friday!!")
  end

  scenario 'I want to see buttons to navigate' do
    sign_up_helper('user1@test.com', '123456')
    log_in_helper('user1@test.com', '123456')
    new_post_helper("It's almost Friday!!")

    click_button('Go to my profile')
    expect(page).to have_button('Go to posts')
    expect(page).to have_button('Add pictures')
    expect(page).to have_button('Log out')
  end

  scenario 'I want to be able to return to the main posts page' do
    sign_up_helper('user1@test.com', '123456')
    log_in_helper('user1@test.com', '123456')
    new_post_helper("It's almost Friday!!")

    click_button('Go to my profile')
    click_button('Go to posts')
    expect(page).to have_button('Go to my profile')
    expect(current_path).to eq('/posts')
  end
end
