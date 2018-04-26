require 'rails_helper'

RSpec.feature "User can delete a comment", type: :feature do
  scenario "User creates and delete the comment" do
    user_sign_up

    fill_in "post-message", with: "Hello, world!"
    click_button "Post"

    fill_in "post-comment", with: "Morning, world!"
    click_button "Comment"
    expect(page.all('#comments').first).to have_content("Morning, world!")

    find('#comments').click_link("Delete")
    expect(page.all('#comments').first).not_to have_content("Morning, world!")
  end
end
