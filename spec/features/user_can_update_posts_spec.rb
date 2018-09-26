require 'rails_helper'
require 'web_helper'

RSpec.feature "Update Posts", type: :feature do
  scenario "user can update post" do
    submit_test_post
    visit("/")
    click_link "test post"
    click_link "Edit"
    fill_in "content", with: "edited post"
    click_button "submit"
    expect(page).to have_content("edited post")
  end
end
