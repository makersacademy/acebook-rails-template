require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete posts" do
    sign_up
    sign_in
    add_post

    find("input[type=submit][value='Delete Post']").click
    expect(page).not_to have_content("Hello, world!")
  end
end