require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit comments on posts" do
    add_new_post
    click_link "Show"
    fill_in "comment[commenter]", with: "Charlene"
    fill_in "comment[body]", with: "Hello, world!"
    click_button "Create Comment"
    expect(page).to have_content("Charlene")
    expect(page).to have_content("Hello, world!")
  end
end
