# frozen_string_literal: true

require 'rails_helper'
require 'clearance_helpers'

RSpec.feature 'Timeline', type: :feature do
  before do
    sign_up_with('username', 'test@mail.com', 'testing')
  end

  describe 'A User' do
    scenario 'Can edit post' do
      visit '/posts'
      click_link 'Add new post'
      fill_in 'post_message', with: 'Hello, world!'
      click_button 'Submit'
      visit '/posts'
      click_link 'Edit post'
      fill_in 'post[message]', with: 'Hello, world again!'
      click_button 'Update Post'
      expect(page).to have_content('Hello, world again!')
    end

    scenario 'Can delete post' do
      visit '/posts'
      click_link 'Add new post'
      fill_in 'post_message', with: 'Hello, world!'
      click_button 'Submit'
      visit '/posts'
      click_link 'Delete post'
      expect(page).to_not have_content('Hello, world!')
    end
  end

  scenario "A diffent user can't delete other's posts" do
    url = URI.parse(current_url)
    url.request_uri
    click_link 'Add new post'
    fill_in 'post_message', with: 'Hello, world!'
    click_button 'Submit'
    visit url
    sign_out
    click_link 'Sign up'
    sign_up_with('otherusername', 'othertest@mail.com', 'othertesting')
    expect(page).not_to have_button('Delete post')
  end

  scenario "A diffent user can't post other's posts" do
    url = URI.parse(current_url)
    url.request_uri
    click_link 'Add new post'
    fill_in 'post_message', with: 'Hello, world!'
    click_button 'Submit'
    visit url
    sign_out
    click_link 'Sign up'
    sign_up_with('otherusername', 'othertest@mail.com', 'othertesting')
    expect(page).not_to have_button('Edit post')
  end

  scenario 'can have the time the post was created' do
    url = URI.parse(current_url)
    url.request_uri
    click_link 'Add new post'
    fill_in 'post_message', with: 'This is a new post'
    click_button 'Submit'
    visit url
    t = DateTime.now
    expect(page).to have_text(t.strftime('Posted: %d/%m/%Y'))
  end
end
