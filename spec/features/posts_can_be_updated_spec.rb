require "rails_helper"
require "./spec/helpers/sign_up_helper"

RSpec.feature "format post", type: :feature do
  scenario "Postsshould be formatted with line breaks" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world"
    click_button "Submit"
    click_link "Update"
    fill_in "Message", with: "Goodbye, world"
    click_button "Submit"
    expect(page).to have_content("Goodbye, world")
    expect(page).not_to have_content("Hello, world")
  end
end
