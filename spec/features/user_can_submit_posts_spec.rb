require 'rails_helper'

 RSpec.feature "Timeline", type: :feature do
     before :each do
        allow(controller).to receive(:authenticate_user!).and_return(true)
      end
   scenario "Can submit posts and view them" do
     visit "/posts"
     click_link "New post"
     fill_in "Message", with: "Hello, world!"
     click_button "Submit"
     expect(page).to have_content("Hello, world!")
   end
 end
