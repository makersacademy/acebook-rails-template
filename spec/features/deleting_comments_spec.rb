require 'rails_helper'

RSpec.feature "User", type: :feature do
  scenario "Can delete comments" do
    signup
    login
    visit "/posts"
    click_on "New post"
    fill_in "Message", with: "Hello,\nworld!"
    click_button "Submit"
    expect(page.html).to include("Hello,\r<br>world!")

    click_button "Comments"
    fill_in "comment_text", with: "Some comment"
    click_button "Submit"
    expect(page.html).to include("Some comment")

    visit "/signup"
    visit "/posts"
    click_button "Comments"
    
    click_on " Delete "
    expect(page.html).to_not include("Some comment")
  end
end
