# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Add comment', type: :feature do
  scenario 'user can add a comment to a post' do
    sign_up
    add_new_post
    add_comment
    expect(page).to have_content 'First comment!!'
  end

  scenario "a second user can comment on another user's post" do
    sign_up
    add_new_post
    click_link 'Logout'
    sign_up_second_user
    click_link 'Add comment'
    fill_in 'Comment', with: '+1 totally agree'
    click_button 'Submit'
    expect(page).to have_content '+1 totally agree'
  end
end
