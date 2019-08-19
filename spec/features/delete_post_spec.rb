require 'rails_helper'

RSpec.feature "Deletes a post", type: :feature do
    scenario "User deletes a post" do
        sign_up
        click_link 'New post'
        fill_in 'post[message]', with: "This is my post"
        click_button 'Submit' 
        click_link 'Delete Post'
        expect(page).to_not have_content "This is my post"
    end
end