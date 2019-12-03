require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    fill_in "Username", with: "Robot"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_css("ul", text: "Hello, world!")
    expect(page).to have_css("ul", text: "Robot")
  end
end
