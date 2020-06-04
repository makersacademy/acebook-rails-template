
# require 'rails_helper'

# RSpec.feature "Login", type: :feature do
#   scenario "Cannot login with incorrect email" do
#     User.create(first_name: "Sam", last_name: "Gangi", email: "samgangi@lotr.com", password: "theshire")
#     visit "/sessions/new"

#     fill_in "user[email]", with: "samgangsi@lotr.com"
#     fill_in "user[password]", with: "theshire"
#     click_button "Submit"

#     expect(page).to have_content("Incorrect email/password")
#   end

#   scenario "Cannot login with incorrect email" do
#     User.create(first_name: "Sam", last_name: "Gangi", email: "samgangi@lotr.com", password: "theshire")
#     visit "/sessions/new"

#     fill_in "user[email]", with: "samgangi@lotr.com"
#     fill_in "user[password]", with: "sauron"
#     click_button "Submit"

#     expect(page).to have_content("Incorrect email/password")
#   end
# end
