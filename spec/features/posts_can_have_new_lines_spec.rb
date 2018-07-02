require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Posts can have multiple lines" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!\n This is a post with multiple \n lines"
    click_button "Submit"
    expect(page).to have_content("Hello, world!\n This is a post with multiple \n lines")
  end
end
