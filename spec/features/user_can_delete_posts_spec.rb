require 'rails_helper'

RSpec.feature "Delete post", type: :feature do
  scenario "Can delete own post" do
    create_user
    login_user
    visit '/posts'
    create_post
    click_button "Delete"
    expect(page).to have_no_content("Hello, world!")
  end

  scenario "User cannot delete another user's post" do
    create_user
    login_user
    visit '/posts'
    create_post
    logout_user

    create_user_two
    login_user_two
    visit '/posts'
    click_button 'Delete'
    expect(page).to have_content "Hello, world!"
  end
end
