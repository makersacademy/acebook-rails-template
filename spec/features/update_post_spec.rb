require 'rails_helper'
require_relative '../support/feature_web_helpers'
require_relative '../support/capybara_selectors'

RSpec.feature "Update posts", type: :feature do
  scenario "User can update their own post" do
    visit "/"
    fill_in_signup_form_and_submit
    post_hello_world_message
    click_button "Update"
    fill_in 'Message', with: "Goodbye, world!"
    click_button "Accept"
    expect(page).to have_content("Goodbye, world!")
    expect(page).not_to have_content("Hello, world!")
  end
end
