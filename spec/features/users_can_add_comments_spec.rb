# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Adding comments', type: :feature do
  scenario 'You can add comments to a post ' do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'post'
    click_button 'Submit'
    fill_in 'comment', with: 'hey sounds good buddy'
    click_button 'Comment'
    expect(page).to have_content 'hey sounds good buddy'
  end
end
