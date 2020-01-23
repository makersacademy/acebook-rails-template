require 'rails_helper'

RSpec.feature "Timeline on main wall", type: :feature do

  before do
    sign_up("Example1", "email@example.com", "pass12", "pass12")
    click_button "New post"
  end

  context "On user wall" do

    scenario "can submit posts and view them" do
      fill_in "Message", with: "Hello, world!"
      post_time = Time.now
      click_button "Submit"

      expect(page).to have_content("Hello, world!")
      expect(page).to have_content("Date posted: #{post_time.strftime('%d %B %Y at %l:%M %p')}")
      expect(page).to have_content("Posted by Example1")
    end

    scenario "posts are ordered reverse chronologically" do
      fill_in "Message", with: "Hello, world!"
      click_button "Submit"

      click_button "New post"
      fill_in "Message", with: "Hello again, world!"
      click_button "Submit"

      expect(first('.post')).to have_content "Hello again, world!"
    end

    scenario "posts render line breaks correctly" do
      fill_in "Message", with: "Hello, world!\r\nNew Line"
      click_button "Submit"

      expect(page).to have_text "Hello, world!\nNew Line"
    end

  end

  context "On posts wall" do
    scenario "can submit posts to the posts wall and view them" do
      visit root_path
      click_button "New post"

      fill_in "Message", with: "Hello, world!"
      post_time = Time.now
      click_button "Submit"

      expect(page).to have_content("Hello, world!")
      expect(page).to have_content("Date posted: #{post_time.strftime('%d %B %Y at %l:%M %p')}")
      expect(page).to have_content("Posted by Example1")
    end

    scenario "posts submitted to a user's wall do not show on the posts wall" do

      fill_in "Message", with: "Hello, world!"
      post_time = Time.now
      click_button "Submit"

      expect(page).to have_content("Hello, world!")
      expect(page).to have_content("Date posted: #{post_time.strftime('%d %B %Y at %l:%M %p')}")
      expect(page).to have_content("Posted by Example1")

      visit root_path

      expect(page).not_to have_content("Hello, world!")
      expect(page).not_to have_content("Posted by Example1")
    end
  end

end
