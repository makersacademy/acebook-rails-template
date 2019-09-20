# frozen_string_literal: true

require 'rails_helper'
require 'clearance_helpers'

RSpec.feature 'Own Wall', type: :feature do
  before do
    sign_up_with('username', 'test@mail.com', 'testing')
  end

  scenario 'user can see posts on their own wall' do
    url = URI.parse(current_url)
    url.request_uri
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello world!'
    click_button 'Submit'
    visit url
    expect(page).to have_content('Hello world!')
  end

  scenario 'User can\'t see other people posts in their own wall' do
    url = URI.parse(current_url)
    url.request_uri
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello world!'
    click_button 'Submit'
    sign_out
    sign_up_with('otherusername', 'othertest@mail.com', 'othertesting')
    visit url
    expect(page).not_to have_content('Edit Post')
  end

  # scenario "User can see other people albums" do
  #   create_post
  #   visit '/albums/new'
  #   fill_in "album_title", with: "Album title"
  #   click_button "Add"
  #   sign_out
  #   sign_up_with('otherusername', 'othertest@mail.com', 'othertesting')
  #   p current_url
  #   click_link 'username'
  #   expect(page).to have_content('Album title')
  # end

  scenario 'users can see all the posts in the posts section' do
    url = URI.parse(current_url)
    url.request_uri
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello world!'
    click_button 'Submit'
    sign_out
    sign_up_with('otherusername', 'othertest@mail.com', 'othertesting')
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello world again!'
    click_button 'Submit'
    expect(page).to have_content('Hello world!')
    expect(page).to have_content('Hello world again!')
  end

  # scenario "User can see albums in the wall"
end

def create_post
  visit '/posts'
  click_link 'Add new post'
  fill_in 'post_message', with: 'Hello, world!'
  click_button 'Submit'
end
