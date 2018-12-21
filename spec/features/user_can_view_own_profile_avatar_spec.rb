require 'rails_helper'
require_relative '../support/feature_web_helpers'

RSpec.feature "User has avatar", type: :feature do
  scenario "User can view their profile with avatar" do
    visit "/"
    fill_in_signup_form_and_submit
    post_hello_world_message
    click_link("First name")
    expect(page).to have_content("First name Last name")
    expect(page).to have_content("Hello, world!")
    expect(page).to have_xpath("//img")
    expect(current_path).to eq("/users/1")
  end
end
