require 'rails_helper'

RSpec.feature 'Delete', type: :feature do
  scenario 'user can delete their posts' do
    signing_up
    click_link "New post"
    fill_in "Message", with: "Hello Guys!"
    click_button "delete"

    expect(page). to have_content "This post was successfully deleted"
  end
end
