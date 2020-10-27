# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Delete post', type: :feature do
  scenario 'user can delete a post' do
    sign_up
    add_new_post
    expect(page).to have_content('Hello, world!')
    click_link 'Delete'
    expect(page).not_to have_content('Hello, world!')
  end

  scenario "user can't delete someone else's post" do
    sign_up
    add_new_post
    click_link 'Logout'
    sign_up_second_user
    click_link 'Delete'
    expect(page).to have_content "That post doesn't belong to you"
  end
end
