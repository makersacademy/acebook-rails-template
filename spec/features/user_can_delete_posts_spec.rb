require 'rails_helper'
require 'web_helper'

RSpec.feature "New Posts", type: :feature do
  scenario "user can post message" do
    submit_test_post
    visit("/")
    click_link "test post"
    click_link "Delete"
    visit("/")
    expect(page).not_to have_content("test post")
  end

end
