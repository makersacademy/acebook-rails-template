# require 'rails_helper'

# RSpec.feature "Timeline", type: :feature do
#   scenario "Can submit posts and view them, with the time!" do

#     time = Time.new()
#     formatted_time = time.strftime("%-dth %b, %l:%M%P")

#     visit "/posts"
#     click_link "New post"
#     fill_in "Message", with: "Hello, world!"
#     click_button "Submit"
#     expect(page).to have_content("Hello, world!")
#     expect(page).to have_content(formatted_time)
#   end
# end
