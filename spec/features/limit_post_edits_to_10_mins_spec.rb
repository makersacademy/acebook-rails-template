# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Stops post edits after 10 minutes", type: :feature do

  scenario "Displays error when user clicks edit 10 minutes after post creation" do
    sign_up_helper('user@test.com', '123456')
    new_post_helper('My new test post')
    travel(601)
    click_link 'edit'
    expect(page).to have_content 'Sorry, you can only edit this post in the first 10 minutes after creation'
  end
  scenario "User can edit a post within 10 minutes of creation" do
    sign_up_helper('user@test.com', '123456')
    new_post_helper('My new test post')
    travel(530)
    click_link 'edit'
    # Look for edit post forms on the current page
    expect(all(:css, 'form.edit_post')).to_not eq []
  end
end
