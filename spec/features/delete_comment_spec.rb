# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Delete comment', type: :feature do
  scenario 'user can delete their comment' do
    sign_up
    add_new_post
    add_comment
    expect(page).to have_content 'First comment!!'
    click_link 'Delete Comment'
    expect(page).not_to have_content 'First comment!!'
  end

  scenario "user can't delete someone else's post" do
    sign_up
    add_new_post
    add_comment
    click_link 'Logout'
    sign_up_second_user
    click_link 'Delete Comment'
    expect(page).to have_content "That comment doesn't belong to you"
  end
end
