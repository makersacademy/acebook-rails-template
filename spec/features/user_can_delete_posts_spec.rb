require 'rails_helper'

RSpec.feature "Deleting", type: :feature do
  scenario "Can delete posts" do
    sign_up
    add_post
    click_link "Delete"
    expect(page).not_to have_content("Hello, world!")
    expect(page).to have_current_path("/posts")
  end
  scenario "User cannot delete posts they do not own" do
    create_user_2
    create_user_3
    sign_in_user_2
    add_post
    click_link "Logout"
    sign_in_user_3
    expect(find("div#post_0")).not_to have_link("Delete")
  end
end
