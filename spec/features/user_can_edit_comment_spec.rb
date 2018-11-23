# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Updating Comments', type: :feature do
  before do
    login(email: 'test@user.com', password: 'qwerty')
  end

  scenario 'user can update their own comments within 10 minutes' do
    click_link 'I am test user'
    click_button 'Comment'
    fill_in('comment_body', with: 'First comment!')
    click_button 'Submit'
    click_link 'First comment!'
    Timecop.freeze(time = 9.minutes.from_now) do
      click_button 'Edit'
      fill_in('Message', with: 'Goodbye, world!')
      click_button 'Submit'
      expect(page).to have_content('Goodbye, world!')
      expect(page).not_to have_content('First comment!')
    end
  end

  # scenario "user cannot update a post after 10 minutes" do
  #   click_link 'Hello, world!'
  #   Timecop.freeze(time = 11.minutes.from_now) do
  #     click_button 'Edit'
  #     expect(page).to have_content('Error: You do not have permissions to edit this message 10 mins after creation')
  #   end
  # end
  #
  # scenario "user cannot update another user's post" do
  #   click_link 'This is test user 2'
  #   expect(page).not_to have_button("Edit")
  # end

end
