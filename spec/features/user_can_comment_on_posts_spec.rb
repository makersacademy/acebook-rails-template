require 'rails_helper'

RSpec.feature "Comments", type: :feature do

  before do
    sign_up("email@example.com", "pass12", "pass12")
    post("Hello, world!")
  end

  scenario "user can leave a comment on a post" do

    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Posted by email@example.com")

    click_on "Comment"
    fill_in "Message", with: "Excellent post!"
    comment_time = Time.now
    click_button "Submit"

    expect(page).to have_content("Comment successful. Far out!")
    expect(page).to have_content("Excellent post!")
    expect(page).to have_content("Date: #{comment_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by email@example.com")
  end

  scenario "comments are ordered reverse chronologically" do
    click_on "Comment"
    fill_in "Message", with: "Excellent post!"
    click_button "Submit"

    click_on "Comment"
    fill_in "Message", with: "I did not enjoy this message."
    click_button "Submit"

    expect(first('.comment')).to have_content "I did not enjoy this message."
  end

end
