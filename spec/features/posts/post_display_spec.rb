require 'rails_helper'

describe "Post Index" do 

    before do
        travel_to Time.local(1994)
    end
    
    after do 
        travel_back
    end

    it "can have the time the post was created " do 
        sign_in
        visit '/posts'
        click_link "New post"
        fill_in 'Message', with: "This is a new post"
        click_button 'Submit'
        t = Time.now
        expect(page).to have_content("12:00 AM, 01 of January")
    end
end
