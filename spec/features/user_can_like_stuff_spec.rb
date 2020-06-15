# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Likes', type: :feature do
  before :each do
    createUser
    signin
    postMessage
  end

  scenario 'Can add a like to a post' do
    all('a', text: 'Like')[0].click
    expect(page).to have_content '1 like'
  end

  scenario 'Can unlike a post' do
    all('a', text: 'Like')[0].click
    all('a', text: 'Unlike')[0].click
    expect(page).to have_content '0 likes'
  end

  scenario 'Can add a like to a comment' do
    click_link 'Comment'
    fill_in 'comment_content', with: 'No comment'
    click_button 'Submit'
    all('a', text: 'Like')[1].click
    expect(page).to have_content '1 like'
  end

  scenario "Can unlike a comment" do
    click_link 'Comment'
    fill_in 'comment_content', with: 'No comment'
    click_button 'Submit'
    all('a', text: 'Like')[1].click
    all('a', text: 'Unlike')[0].click
    expect(page).to have_content '0 likes'
  end

  scenario "Can't like twice" do
    all('a', text: 'Like')[0].click
    expect(page).not_to have_content 'Like'
    expect(page).to have_content 'Unlike'
  end
end
