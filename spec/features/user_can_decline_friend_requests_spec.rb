# frozen_string_literal: true

require 'rails_helper'

describe 'can make a friend request' do
  it 'create new friend request' do
    # create a new post
    new_post
    log_out
    # sign in as someone else
    sign_up2
    click_link 'Add Friend'
    click_button 'Send request'
    click_link 'Friends'
    click_link 'Decline'
    expect(page).to have_content('Friend was successfully deleted.')
  end
end
