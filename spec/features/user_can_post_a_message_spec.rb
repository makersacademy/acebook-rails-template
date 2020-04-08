require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
    scenario "Can post a message" do
        # visit '/'
        # fill_in "username", with: "stephan"
        # fill_in "password", with: "password"
        # click_button "Sign In"
        visit '/posts/new'
        fill_in "message", with: "Hello there"
        click_button "Post"
        expect(page).to have_content("Hello there")
    end
end