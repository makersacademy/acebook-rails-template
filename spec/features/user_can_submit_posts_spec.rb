require 'rails_helper'
require "webhelper"

feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    go_homepage
    sign_up
    create_post
    expect(page).to have_content("Hello, world!")
  end

  scenario " Submitted posts are assigned to a user " do
    go_homepage
    sign_up
    create_post
    expect(page).to have_content("created by 3")
  end

end
