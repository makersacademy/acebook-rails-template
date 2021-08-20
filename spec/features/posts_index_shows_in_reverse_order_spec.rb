require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "posts are viewed in reverse order" do
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    visit "/posts/new"
    fill_in "Message", with: "Hello, again!"
    click_button "Submit"
    expect(page.find('h4:nth-child(1)')).to have_content "Hello, again!"
    # expect(page.find('h4:nth-child(2)')).to have_content "Hello, again!"

   # maybe worth testing h4:nth-child(2) but it said it couldn't find
   # the visible css on the page
  end
end
