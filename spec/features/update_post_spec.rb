require 'rails_helper'
require_relative '../support/feature_web_helpers'
require_relative '../support/capybara_selectors'

RSpec.feature "Update posts", type: :feature do
  scenario "User can update their own post" do
    visit "/"
    fill_in_signup_form_and_submit
    post_hello_world_message
    expect(current_path).to eq "/users/1"
    click_button "Update"
    within "div#update.card.card-body" do
      fill_in 'Message', with: "Goodbye, world!"
    end
    click_button "Accept"
    expect(current_path).to eq "/users/1"
    expect(page).to have_content("Goodbye, world!")
    expect(page).not_to have_content("Hello, world!")
  end
end
