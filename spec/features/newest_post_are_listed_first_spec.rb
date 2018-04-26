require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User can submit a post and posts are sorted in a DESC order" do
    user_sign_up

    fill_in "post-message", with: "Hello, world!"
    click_button "Post"

    fill_in "post-message", with: "Bye, world!"
    click_button "Post"

    expect(page.all('#posts').first.text).to include("Bye, world!")
  end
end
