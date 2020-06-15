require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts with line breaks" do
    signup
    visit "/posts"
    click_on "New post"
    fill_in "Message", with: "Hello,\nworld!"
    click_button "Submit"
    expect(page.html).to include("Hello,\r<br>world!")
  end
end
