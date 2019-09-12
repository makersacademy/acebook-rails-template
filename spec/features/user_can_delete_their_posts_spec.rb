require "rails_helper"

RSpec.feature "Delete posts", type: :feature do
  scenario "A user can delete their posts" do
    sign_in

    visit("/posts")
    click_button "New Post"
    fill_in "post_message", with: "My new post"
    click_on "Submit"
    click_button "delete"

    expect(page).not_to have_content("My new post")
  end

  scenario "A user cannot delete other peoples posts" do
    sign_in
    visit("/posts")
    click_on "New Post"
    fill_in "post_message", with: "My new post"
    click_on "Submit"
    sign_out
    visit "/sign_up"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "password"
    click_button "Sign up"
    visit "/posts"
    click_button "delete"

    expect(page).to have_content("Calm down, you can only delete your own posts")
  end
end
