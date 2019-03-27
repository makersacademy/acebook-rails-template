require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    time = Time.new
    expect(page).to have_content("#{time.strftime('%d/%m/%Y')}")
  end

  scenario "Can update a post and view the updated post" do
    visit "/posts"
    click_button "Edit"
    fill_in "Message", with: "A changed post"
    click_button "Submit"
    expect(page).to have_content("A changed post")
  end
end
