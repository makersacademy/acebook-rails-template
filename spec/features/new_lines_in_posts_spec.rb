require 'rails_helper'

 #js: true add to rspec if needed

RSpec.feature "New Post", type: :feature do
#   scenario "Can create posts with new lines" do
#     visit "/posts"
#     click_link "New post"
#     find('#post_message').set("hello\n")
#     # fill_in "Message", with: "Hello, world!"
#     # find('#post_message').send_keys(:enter)
#     # fill_in "Message", with: "Bye world!"
#     expect(current_path).to eq '/posts/new'
#   end
    scenario "Can create posts with new lines" do
      login(email: "test@user.com", password: "qwerty")
      post_message(message: "Hello, world\nBye world")
      expect(page).to have_content "Hello, world\nBye world"
    end
end
