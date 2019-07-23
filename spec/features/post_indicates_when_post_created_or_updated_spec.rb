require 'rails_helper'
require 'sign_up_helper'

RSpec.feature "Display if post has been updated", type: :feature do
  xscenario "Posts display date of update if they have been updated" do
    sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world! created on #{date}")
    click_button "Edit"
    expect(page).to have_content("updated on #{date}")
  end
end
