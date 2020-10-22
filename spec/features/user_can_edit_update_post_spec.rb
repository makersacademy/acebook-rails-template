require 'rails_helper'

feature "Update Post" do
  scenario "Can update an existing post written by the user" do
    sign_up
    make_post
    click_link "Edit"
    expect(page).to have_content("Hello, world!")
    fill_in "post[message]", with: "Goodbye, world!"
    click_button "Update Post"
    expect(page).to have_current_path('/')
    expect(page).to have_content("Goodbye, world!")
    expect(page).to have_content("Edited")
  end
end