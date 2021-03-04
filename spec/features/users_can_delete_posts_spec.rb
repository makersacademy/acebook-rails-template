# frozen_string_literal: true

require 'rails_helper'
include WelcomeHelper

RSpec.feature 'User can delete their posts' do
  scenario 'when a user would like to delete a post' do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Delete'
    expect(page).not_to have_content 'Hello, world!'
  end
end
