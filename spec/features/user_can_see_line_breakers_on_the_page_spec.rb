require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit a post with a line break and view it on the post page" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Test line break\nSecond line\nThird line"
    click_button "Submit"
    expect(page.html).to include("<p>Test line break\r<br>Second line\r<br>Third line</p>")
  end
end
