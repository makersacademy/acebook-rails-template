#frozen_string_literal: true

require 'rails_helper'

feature 'User can edit posts' do
  scenario 'User can edit his own post on his own wall' do
    signup_and_click
    click_on 'New Post'
    fill_in 'Message', with: 'MessageInACup'
    click_button 'Submit'
    click_link 'MessageInACup'
    click_on 'Edit'
    fill_in 'post_message', with: 'MessageInABottle'
    click_on 'Submit'
    expect(page.current_path).to eq '/users/1'
    expect(page).not_to have_content 'MessageInACup'
    expect(page).to have_content 'MessageInABottle'
  end
end
