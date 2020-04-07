require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
    scenario "Can post a message" do
        visit '/'
        fill_in "username", with: "stephan"
        fill_in "password", with: "password"
        click_button "Sign In"
        fill_in "post_message", with: "Hello there"
        expect(page).to have_content("Hello there")
    end
end