# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Updating Comments', type: :feature do
  before do
    login(email: 'test@user.com', password: 'qwerty')
    click_link 'I am test user'
    comment(body: 'First comment!')
  end

  scenario 'user can update their own comments within 10 minutes' do
    Timecop.freeze(time = 9.minutes.from_now) do
      click_button 'Edit Comment'
      fill_in(:comment_body, with: 'Goodbye, world!')
      click_button 'Submit'
      expect(page).to have_content('Goodbye, world!')
      expect(page).not_to have_content('First comment!')
    end
  end

  scenario "user cannot update a post after 10 minutes" do
    Timecop.freeze(time = 11.minutes.from_now) do
      click_button 'Edit Comment'
      expect(page).to have_content('Error: You do not have permissions to edit this comment 10 mins after creation')
    end
  end

  scenario "user cannot update another user's post" do
    click_link 'Logout'
    login(email: 'test2@user.com', password: 'qwerty')
    visit '/'
    click_link 'I am test user'
    expect(page).not_to have_selector(:button, "Edit Comment")
  end
end
