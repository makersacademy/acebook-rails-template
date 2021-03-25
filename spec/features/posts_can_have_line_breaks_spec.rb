require 'rails_helper'

RSpec.feature "Post", type: :feature do
    before(:each) do
      Capybara.current_driver= :selenium
      @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
      @user.save
      sign_in_helper(@user)
    end

    scenario "Can submit and display posts with line breaks" do
      target = 'Hello\n world team lizard!'
      visit "/posts"
      click_link "New post"
      fill_in "Message", with: "Hello\n world team lizard!"
      click_button "Submit"
      expect(page.html).to match(/Hello\s*<br>\s*world team lizard!/)

    end

after(:all) do
    Capybara.use_default_driver
  end
end
