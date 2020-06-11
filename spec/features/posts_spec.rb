require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up
    add_post
    expect(page).to have_content("Hello, world!")
  end

  scenario "Signed up user can edit posts" do
    sign_up
    add_post
    click_link "Edit"
    fill_in "Message", with: "Goodbye, world!"
    click_button 'Submit'
    expect(page).to have_content("Goodbye, world!")
  end


end
