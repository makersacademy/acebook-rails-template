require 'rails_helper'
require_relative '../helpers/users_helper_spec'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    fill_in_sign_up_details
    click_button 'Sign Up'
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
