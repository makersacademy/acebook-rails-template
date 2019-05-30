require 'rails_helper'
require 'dry_helper'

RSpec.feature "Timeline", type: :feature do
  before(:each) do
    visit("/users/sign_up")
    create_user_test_email_dot_com_1234567
  end

  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "What's on your mind?", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
