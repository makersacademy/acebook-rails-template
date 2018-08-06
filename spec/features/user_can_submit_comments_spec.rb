require 'rails_helper'
require 'helpers/users_helper_spec'

RSpec.feature "Comment", type: :feature do

  scenario "Can submit comments and view them" do
    sign_up_test
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "This is a post"
    click_button "Submit"
    fill_in "comment[message]", with: "This is a comment"
    click_button "Create Comment"
    expect(page).to have_css('p', text: "This is a comment")
  end
end
