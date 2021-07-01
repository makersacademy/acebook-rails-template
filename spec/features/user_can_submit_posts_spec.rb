require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    successfullogin
    fill_in "post[message]", with: "Hello, world!"
    click_link "Post"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Last post is on top" do
    successfullogin

    fill_in "post[message]", with: "Message 1"
    click_link "Post"
    fill_in "post[message]", with: "Message 2"
    click_link "Post"
    expect(page.first('p:nth-of-type(1)')).to have_content("Message 2")
    expect(page.first('p:nth-of-type(1)')).not_to have_content("Message 1")
  end
end
