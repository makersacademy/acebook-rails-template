# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Edit comment', type: :feature do
  scenario 'user can edit their comment' do
    sign_up
    add_new_post
    add_comment
    click_link 'Edit Comment'
    find_field('comment[comment]').set "lol ninja'd"
    click_button 'Submit'
    expect(page).not_to have_content 'First comment!!'
    expect(page).to have_content "lol ninja'd"
  end

  scenario "user cannot edit someone else's comment" do
    sign_up
    add_new_post
    add_comment
    click_link 'Logout'
    sign_up_second_user
    click_link 'Edit Comment'
    expect(page).to have_content "That comment doesn't belong to you!"
  end
end
