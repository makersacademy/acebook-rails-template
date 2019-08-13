require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hi"
    click_button "Submit"
    visit '/posts'
    click_on "Update"
    fill_in "Message", with: "Bye"
    expect(page).to have_content("Bye")
  end
end
