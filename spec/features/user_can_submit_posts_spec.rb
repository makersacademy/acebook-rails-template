require 'rails_helper'
require 'web_helpers'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up_and_go_to_new_post
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_css('.post', text: "Hello, world!" && "Posted by: Gandalf The Grey")

end
