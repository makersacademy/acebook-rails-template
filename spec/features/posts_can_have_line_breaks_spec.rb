require 'rails_helper'

RSpec.feature "Post", type: :feature do
    before(:each) do
      @user = User.create(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
      @user.save
      sign_in_helper(@user)
    end

    scenario "Can submit and display posts with line breaks" do
      target = 'Hello\n world team lizard!'
      visit "/posts"
      click_button "New post"
      fill_in "post[message]", with: "Hello\n world team lizard!"
      click_button "Submit"
      expect(page).to have_selector(".container", text: "Hello world team lizard! Lizardo")
    end
end
