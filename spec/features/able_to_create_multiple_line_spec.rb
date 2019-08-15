# require 'rails_helper'

# RSpec.feature "Timeline", type: :feature do
#   scenario "Can submit posts with multiple lines and they'll be displayed", js: true do
#     visit "/posts"
#     click_link "New post"
#     input = find_field 'Message'
#     input.native.send_keys("Hello, world!",:return,  "Second line", :return, "Third line")
#     click_button "Submit"
#     #expect(page).to have_selector("ul#wall li:nth-child(1)", innerHTML:
#     #{}"Hello, world!<br>Second line<br>Third line")
#     expect(page.html).to include("Hello, world!\n<br>Second line\n<br>Third line")
#   end
# end

# #, :return, "Second line", :return, "Third line"

# #\n Second line\n Third line"
