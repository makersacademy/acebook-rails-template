require "rails_helper"
require "./spec/helpers/sign_up_helper"

RSpec.feature "format post", type: :feature do
  scenario "Posts should be formatted with line breaks" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world
    this is a new line"
    click_button "Submit"
    expect(html).to include("br")
  end

  # scenario "If a user visits any page without signing in you are directed to sign up" do
  # end
end
