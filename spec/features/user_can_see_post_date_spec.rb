require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
    scenario "Can view date post was made" do
        visit "/posts"
        click_link "New post"
        fill_in "Message", with: "Hello, world!"
        click_button "Submit"
        expect(page).to have_content(Time.now.to_s(:long_ordinal))
    end
end