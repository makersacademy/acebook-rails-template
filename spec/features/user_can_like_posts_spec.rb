require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and see zero likes" do
    visit "/posts"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Post"

    expect(page).to have_content("0 likes")
  end

  scenario "Can like posts and see incresed likes" do
    visit "/posts"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Post"
    click_link "Like"

    expect(page).to have_content("1 likes")
  end
end