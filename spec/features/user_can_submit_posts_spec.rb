require 'rails_helper'

feature "test index" do
  scenario "Can submit posts and view them" do
    visit 'posts/index'
    save_and_open_page
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
# RSpec.feature "Timeline", type: :feature do

#   end
end
