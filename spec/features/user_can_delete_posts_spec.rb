# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Deleting posts', type: :feature do
  before do
    signup1
  end

  scenario 'User can delete their own post' do
    post_message('Hello, world!')
    click_link('Hello, world!')
    click_button 'Delete'
    expect(page).not_to have_content('Hello, world!')
  end

  scenario "User cannot delete someone else's post" do
    post_message('Hello, world!')
    click_link('Logout')
    signup2
    click_link('Hello, world!')
    click_button 'Delete'
    expect(page).to have_content('Error: You do not have permissions to delete this message')
  end
end
