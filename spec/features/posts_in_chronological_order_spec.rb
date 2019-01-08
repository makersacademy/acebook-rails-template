require 'rails_helper'
require_relative '../support/feature_web_helpers'
require_relative '../support/capybara_selectors'

RSpec.feature "Posts order", type: :feature do
  scenario "The newest posts appear first in the feed" do
    visit "/"
    fill_in_signup_form_and_submit
    post_hello_world_message
    click_button "New Post"
    fill_in("Message", with: 'Goodbye, world!', :match => :prefer_exact)
    click_button "Submit"
    expect("Goodbye, world!").to appear_before("Hello, world!")
    expect("Hello, world!").to_not appear_before("Goodbye, world!")
  end
end
