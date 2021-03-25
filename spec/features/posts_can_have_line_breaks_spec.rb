require 'rails_helper'

RSpec.feature "Post", type: :feature do
    before(:each) do
      Capybara.current_driver= :selenium
    end
    
    xscenario "Can submit and display posts with line breaks" do
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

