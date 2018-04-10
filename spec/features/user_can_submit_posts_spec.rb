require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end

RSpec.feature "Links", type: :feature do
  scenario "Redirected to the Posts page when you click on the link" do
    visit "/"
    click_link "Go to Posts page"
    expect(page).to have_content("Welcome to your Acebook newsfeed!")
  end
end
