# frozen_string_literal: true

require 'rails_helper'
require 'launchy'

RSpec.feature 'Posts', type: :feature do
  scenario 'Can submit posts and view them' do
    sign_up
    add_post
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Signed in user can edit posts' do
    sign_up
    add_post
    within (".edit") do
      click_link "Edit"
    end
    fill_in "Message", with: "Goodbye, world!"

    click_button 'Submit'
    expect(page).to have_content('Goodbye, world!')
  end

  scenario "Signed in user can edit posts, only if its their post" do
    sign_up
    add_post
    within (".edit") do
      click_link "Edit"
    end
  end

  scenario "Signed in users can delete posts, only if its their post" do
    sign_up
    add_post
    within (".delete") do
      click_link "Delete"
    end
  end
end
