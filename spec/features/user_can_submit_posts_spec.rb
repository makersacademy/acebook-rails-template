require 'rails_helper'

feature "Timeline" do
  scenario "Can submit posts and view them" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "can submit post and see users name" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Bob:")
  end

  scenario "can submit post and see date of submission" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content(/\d{4}-\d{2}-\d{2}/)
  end
end
