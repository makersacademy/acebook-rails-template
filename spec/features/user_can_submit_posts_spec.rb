require 'rails_helper'
require 'dry_helper'

RSpec.feature "Timeline", type: :feature do
  before(:each) do
    visit("/users/sign_up")
    create_user_test_email_dot_com_1234567
  end

  scenario "Can submit posts and view them" do
    new_post_hello_world
    expect(page).to have_content("hello world")
  end

  scenario "Newest posts are shown first" do
    new_post_hello_world
    click_link "New post"
    fill_in "What's on your mind?", with: "test 2"
    click_button "Submit"
    expect(page.body.index('test 2')).to be < page.body.index('hello world')
  end
end
