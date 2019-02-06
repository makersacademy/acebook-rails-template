require 'rails_helper'
require 'webhelper'

RSpec.describe "Users own posts", type: :feature do
  scenario "Users can edit posts" do
    go_homepage
    sign_up
    create_post
    click_link 'Edit Post'
    fill_in 'Message', with: "Edited post"
    click_button "Submit"
    expect(page).to have_content "Edited post"
  end
end
