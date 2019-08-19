require 'rails_helper'

RSpec.feature "Editing a post", type: :feature do
    scenario "User can edit post within 10 mintues" do 
        sign_up
        click_link 'New post'
        fill_in 'post[message]', with: "This is my post"
        click_button 'Submit'
        click_link 'Edit Post'
        fill_in 'Message', with: "This is the updated message"
        click_button 'Update Post'
        expect(page).to have_content "This is the updated message"
    end

    scenario 'User cannot edit a post after 10 minutes' do
        sign_up
        click_link 'New post'
        fill_in 'post[message]', with: "This is my post"
        click_button 'Submit'
        new_time = Time.now + 600
        Timecop.travel(new_time)
        click_link 'Edit Post'
        expect(page).to have_content "Return to posts"
    end

end