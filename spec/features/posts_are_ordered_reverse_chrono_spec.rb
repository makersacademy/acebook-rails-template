require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
    scenario "Posts are in reverse chronologcal order" do
        visit "/users/sign_up"
        fill_in 'user_email', with: "1234@gmail.com"
        fill_in 'user_password', with: "password"
        fill_in 'user_password_confirmation', with: "password"
        find('.actions').find('input').click

        click_link "New post"
        fill_in "Message", with: "1"
        click_button "Submit"
        
        click_link "New post"
        fill_in "Message", with: "2"
        click_button "Submit"
        
        posts = page.all('.post')
        
        expect(posts[0]).to have_content("2")
    end
end
