# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Editing posts", type: :feature do
  scenario "An 'edit' link should appear on a user's post" do
    sign_up
    create_post
    expect(page).to have_link('Edit')
  end

  scenario "An 'edit' link should not appear on a different user's post" do
    sign_up email: 'user1@gmail.com'
    create_post
    sign_up email: 'user2@gmail.com'
    visit '/posts'
    expect(page).not_to have_link('Edit')
  end

  scenario "The edit link should go to the edit page for the post" do
    sign_up
    create_post
    click_link 'Edit'
    expect(page).to have_content('Edit post')
  end
end
