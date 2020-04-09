require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
    scenario "Can post a message" do
        User.create(name: "stephan", dob: '2020-04-04', cob: 'sath efrica', mob: 112, email: 'stephan@test.com', password: "password")
        visit '/'
        fill_in "email", with: "stephan@test.com"
         fill_in "password", with: "password"
         click_button "Sign In"
        visit '/posts/new'
        fill_in "message", with: "Hello there"
        click_button "Post"
        expect(page).to have_content("Hello there")
    end
end