require 'rails_helper'

RSpec.feature "posts from profile page", type: :feature do
    scenario "A user can log in, view their profile page, and post from their own profile" do
        login_george_manyposts
        click_on "George Manyposts", match: :first
        expect(page.html).to include("George Manyposts's Profile")
        fill_in "post_message", with: "This was posted from my own profile"
        click_on "Submit"
        expect(page.html).to include("This was posted from my own profile")
    end

    scenario "A user can log in, view another user's profile page, and post from their profile" do
        login_percy_onepost
        click_on "George Manyposts", match: :first
        expect(page.html).to include("George Manyposts's Profile")
        fill_in "post_message", with: "This is Percy posting on George's profile"
        click_on "Submit"
        expect(page.html).to include("Percy posting on George's profile")
    end
end