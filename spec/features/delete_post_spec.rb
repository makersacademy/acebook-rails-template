require "rails_helper"

RSpec.feature "Timeline", type: :feature do
  scenario "User can see delete button" do
    user_sign_up

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page.all("#posts").first.text).to include("Delete this post")
  end

  scenario "User can delete their post" do
    user_sign_up

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Delete this post"
    expect(page.all("#posts").first.text).not_to include("Hello, world!")
  end
end
