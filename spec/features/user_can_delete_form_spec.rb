require 'rails_helper'
require_relative './method_helpers'
require_relative './sign_up_helper'


RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    registration
    click_link "New post"
    fill_in "Message", with: "Hi"
    click_button "Submit"
    click_on "Delete"
    expect(page).not_to have_content("Hi")
  end
end
