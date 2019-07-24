require 'rails_helper'
require 'sign_up_helper'

RSpec.feature "Display if post has been updated", type: :feature do
  scenario "Posts display date of update if they have been updated" do
    date = DateTime.now
    date = date.strftime("%d-%m-%Y")
    sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world! created on #{date}")
    click_button "Edit"
    fill_in "Message", with: "Hello, world!!!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!!! updated on #{date}")
  end

  scenario "Posts display date of update if they have been updated a second time" do
    date = DateTime.now
    date = date.strftime("%d-%m-%Y")
    sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world! created on #{date}")
    click_button "Edit"
    fill_in "Message", with: "Hello, world!!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!! updated on #{date}")
    click_button "Edit"
    fill_in "Message", with: "Hello, world!!!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!!! updated on #{date}")
  end
end
