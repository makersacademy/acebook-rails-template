require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete posts" do
    sign_up
    sign_in
    add_post
    find("input[type=submit][value='Edit']").click
    fill_in "post_message", with: "Goodbye, world!"
    find("input[type=submit][value='Submit']").click
    expect(page).to have_content("Goodbye, world!")
  end
end