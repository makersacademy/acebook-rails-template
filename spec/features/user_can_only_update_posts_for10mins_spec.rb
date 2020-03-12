require 'rails_helper'

RSpec.feature "Update Post", type: :feature do
    scenario("User can update a post") do
        sign_up
        make_test_post
        visit '/'
        click_link "Update"
        fill_in 'post_message', with: "totally different thing"
        click_button "Submit"
        expect(page).to have_content("totally different thing")
    end
end


