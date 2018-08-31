require 'rails_helper'

RSpec.feature "After login/signup", type: :feature do
  scenario "Can submit posts" do
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
