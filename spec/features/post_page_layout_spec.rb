require 'rails_helper'

RSpec.feature "layout", type: :feature do
    scenario "order posts by descending with date/time and multiple lines" do
        signup
        click_link "New post"
        fill_in "Content", with: "Hello, world!
        goodbye"
        click_button "Create Post"
        click_link "Back"

        click_link "New post"
        fill_in "Content", with: "blah blah
        hello
        bye"
        click_button "Create Post"
        click_link "Back"

        click_link "New post"
        fill_in "Content", with: "My god chris has
        ridiculous calves"
        click_button "Create Post"
        click_link "Back"

        date = Time.now.utc

        expect(page).to have_content("My god chris has
        ridiculous calves #{date} Show Edit Destroy Amoeba

        blah blah
        hello
        bye #{date} Show Edit Destroy Amoeba

        Hello, world!
        goodbye #{date}")
    end
end
