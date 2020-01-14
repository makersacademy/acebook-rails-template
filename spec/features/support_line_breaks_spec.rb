require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts with line breaks" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello,\nworld!"
    click_button "Submit"
    # p(page)
    p(page.html)
    expect(page.html).to include("Hello,\r<br>world!")
  end
end
