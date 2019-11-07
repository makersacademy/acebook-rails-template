require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User can delete a comment" do
    signup_as_new_user("Josh")
    login_as_user("Josh")
    create_new_post("first post")
    fill_in "comment[text]", with: "nice post :)"
    click_button("Save Comment")
    expect(page).to have_content("nice post :)")
    click_link "Delete Comment"
    expect(page).to have_content("first post")
    expect(page).not_to have_content("nice post :)")
  end
end
