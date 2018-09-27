require 'rails_helper'
require 'web_helper'

RSpec.feature "Delete Posts", type: :feature do
  scenario "user can delete post" do
    user_sign_up
    submit_test_post
    visit("/posts")
    click_link "test post"
    click_link "Delete"
    visit("/posts")
    expect(page).not_to have_content("test post")
  end

end
