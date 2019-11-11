require 'rails_helper'

RSpec.feature "Delete post", type: :feature do
  pending scenario "Can delete own post" do
    create_user
    login_user
    visit '/posts'
    create_post
    click_link "Delete"
    accept_confirm do
      click_button "OK"
    end
    expect(page).to have_no_content("Hello, world!")
  end

  # To revisit once delete popup testing has been fixed
  scenario "User cannot delete another user's post" do
    create_user
    login_user
    visit '/posts'
    create_post
    logout_user

    create_user_two
    login_user_two
    visit '/posts'
    click_link 'Delete'
    expect(page).to have_content "Hello, world!"
  end
end
