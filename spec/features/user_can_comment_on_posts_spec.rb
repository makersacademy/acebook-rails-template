require 'rails_helper'

RSpec.feature "Comments", type: :feature do

  scenario "user can leave a comment on a post" do
    sign_up("email@example.com", "pass12", "pass12")
    post("Hello, world!")

    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Posted by email@example.com")

    click_button "Comment"
    fill_in "Message", with: "Excellent post!"
    comment_time = Time.now
    click_button "Submit"

    expect(page).to have_content("Excellent post!")
    expect(page).to have_content("Date: #{comment_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by email@example.com")
  end

end
