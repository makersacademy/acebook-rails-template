# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Posts have creation dates", type: :feature do
  scenario "Posts have a posted date" do
    sign_up

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content(DateTime.now.strftime("%d-%m-%Y"))
  end
end
