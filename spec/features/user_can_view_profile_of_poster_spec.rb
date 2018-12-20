require 'rails_helper'
require_relative '../support/feature_web_helpers'

RSpec.feature "User can view profile of poster", type: :feature do
  scenario "User can sign up, create a post, then view their profile" do
    visit "/"
    fill_in_signup_form_and_submit
    post_hello_world_message
    click_link("first name")
    save_and_open_page
    expect(page).to have_content("first name's profile")
    expect(current_path).to eq("users/1")
  end
end
