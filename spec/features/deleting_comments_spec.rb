require 'rails_helper'

RSpec.feature "User", type: :feature do
  before do
    Capybara.current_driver = :selenium
  end

  after do
    Capybara.use_default_driver
  end

  scenario "Can delete comments" do
    signup
    visit "/posts"
    click_on "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    click_button "Comments"
    fill_in "comment_text", with: "Some comment"
    click_button "Submit"
    expect(page).to have_content("Some comment")
    
    
    click_on "delete_comment"
    expect(page.html).to_not have_content("Some comment")
  end
end
