# frozen_string_literal: true

require 'rails_helper'
require 'clearance_helpers'

RSpec.feature 'Timeline', type: :feature do
  before do
    sign_up_with('username', 'test@mail.com', 'testing')
  end
  describe 'A User' do
    scenario 'Can create comments in posts' do
      create_post
      fill_in 'comment[body]', with: 'comment for hello world'
      click_button 'Create Comment'
      expect(page).to have_content('Hello, world!')
      expect(page).to have_content('comment for hello world')
    end

    scenario 'Can see all comments in posts' do
      create_post
      fill_in 'comment[body]', with: 'comment for hello world'
      click_button 'Create Comment'
      click_link "Back"
      fill_in 'comment[body]', with: 'Another comment for hello world'
      click_button 'Create Comment'
      expect(page).to have_content('Another comment for hello world')
      expect(page).to have_content('comment for hello world')
    end
  end
end

def create_post
  visit '/posts'
  click_link 'Add new post'
  fill_in 'post_message', with: 'Hello, world!'
  click_button 'Submit'
end