# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Editing comments', type: :feature do
  before(:each) do
    sign_up
    add_new_post
    add_comment
    click_link 'Edit Comment'
    fill_in 'comment[body]', with: 'Makers is great'
    click_button 'Update Comment'
  end

  scenario 'editing a comment updates comment body', :js => true do
    expect(page).to have_content 'Makers is great'
  end

  scenario 'editing a comment removes old comment body', :js => true do
    expect(page).not_to have_content 'Rails is awesome'
  end

  scenario 'editing a comment does not change the comment timestamp', :js => true do
    expect(page).to have_content "Comment Timestamp: #{Time.now}"
  end
end
