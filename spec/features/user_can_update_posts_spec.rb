# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Updating Posts', type: :feature do
  before do
    login(email: 'test@user.com', password: 'qwerty')
    post_message(message: 'Hello, world!')
  end

  scenario 'user can update their own post' do
    click_link 'Hello, world!'
    click_button 'Edit'
    fill_in('Message', with: 'Goodbye, world!')
    click_button 'Submit'
    expect(page).to have_content('Goodbye, world!')
    expect(page).not_to have_content('Hello, world!')
  end

  scenario "user cannot update another user's post" do
    click_link 'Logout'
    login(email: 'test2@user.com', password: 'qwerty')
    visit '/'
    click_link 'Hello, world!'
    click_button 'Edit'
    expect(page).to have_content('Error: You do not have permissions to edit this message')
  end


end
