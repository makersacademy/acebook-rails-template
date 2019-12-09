require 'rails_helper'
require 'web_helpers'
require 'db_helpers'
require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  scenario "Can submit posts and view them" do
    sign_up_and_go_to_new_post
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Delete"
    expect(page).to have_css('.header', text: "Your post has been deleted")
    expect(page).not_to have_content("Hello, world!")
  end

  scenario "cannot delete other people's posts" do
    sign_up_and_go_to_new_post
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_on "navdropdown"
    click_on "Sign out"
    sign_up_second_user
    click_link "Delete"
    expect(page).to have_css('.header', text: "You cannot delete other people's posts")
  end
end
