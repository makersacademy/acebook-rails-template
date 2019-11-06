require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User can submit comments" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    create_new_post("Hello, world!")
    fill_in "comment[text]", with: "Great post!"
    click_button "Save Comment"
    expect(page).to have_content("Great post!")
  end
end
