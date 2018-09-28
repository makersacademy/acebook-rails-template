require "rails_helper"
require "web_helper"

RSpec.feature "Profile Pages", type: :feature do
  scenario "user can view a profile page" do
    user_sign_up
    submit_test_post
    click_link "Bob"
    expect(page).to have_content("Bob")
    expect(page).to have_content("test post")
  end
end
