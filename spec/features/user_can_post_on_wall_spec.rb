# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Post on wall", type: :feature do
  context "User 2 can post on user 1's wall" do  
    before do
      
      # Our feature tests should not be relying on the User model. Modify these tests after username has been adder to user model

      user_1 = User.create(email: "user1@gmail.com",
                           password: "password")
      user_2 = User.create(email: "user2@gmail.com",
                           password: "password")
      log_in email: "user2@gmail.com", password: "password"
      visit "/#{user_1.id}"
      click_link "Create new post"
      fill_in "Message", with: "Hello User 1"
      click_button "Submit"
    end

    xit "user 2 is redirected to user 1's wall after posting" do
      expect(page).to have_content ("User1@gmail.com's Wall")
    end

    xit "user 2 can see post on user 1s wall" do
      expect(page).to have_content ("Hello User 1")
    end

    xit "user 2 can not see post on their own wall" do
      visit "/#{user_2_id}"
      expect(page).not_to have_content ("Hello User 1")
    end
  end
end