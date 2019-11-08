# frozen_string_literal: true 
require 'rails_helper'

RSpec.feature "Delete", type: :feature do
  scenario "Can delete posts" do
    visit('/')
    create_user
    login_user
    create_post
    click_link 'Delete'
    expect(page).not_to have_content('Hello, world!')
  end

  scenario "Cannot delete a post by another user" do
    visit('/')
    create_user
    login_user
    create_post
    logout_user
    create_user_two
    login_user_two
    click_link 'Delete'
    expect(page).to have_content("Sorry! You can't delete someone else's post.")
    expect(page).to have_content('Hello, world!')
  end
end
