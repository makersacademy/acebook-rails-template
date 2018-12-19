require 'rails_helper'
require_relative '../support/feature_web_helpers'
require_relative '../support/capybara_selectors'

RSpec.feature "Posts order", type: :feature do
  scenario "The newest posts appear first in the feed" do
    signup
    post_hello_world_message
    click_link "New post"
    fill_in "Message", with: "Goodbye, world!"
    click_button "Submit"
    expect("Goodbye, world!").to appear_before("Hello, world!")
  end
end
