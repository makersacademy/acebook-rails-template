require 'rails_helper'
require_relative '../support/feature_web_helpers'
require_relative '../support/capybara_selectors'
require 'pry'

RSpec.feature "Delete posts", type: :feature do
  scenario "User can delete their own post" do
    visit "/"
    fill_in_signup_form_and_submit
    post_hello_world_message
    click_link 'Delete'
    expect(page).not_to have_content("Hello, world!")
  end
end
