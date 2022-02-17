require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete posts" do
    sign_up_user
    
    visit "/"
    
    fill_in "Message", with: "Hello, world!"
    click_button "Post"

    click_link "Delete"
    expect(page).to_not have_content("Hello, world!")
  end
end
