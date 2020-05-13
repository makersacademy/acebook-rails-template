require 'rails_helper'

RSpec.feature "Delete post", type: :feature do 
    xscenario "user can delete a post" do
        User.create(name: "Gina", password: "123456", email: "gina@example.com")
        visit "/sessions/new"
        fill_in "session[name]", with: "Gina"
        fill_in "session[password]", with: "123456"
        click_on "Log in"
        click_on "New post"
        fill_in "Message", with: "Hello"
        click_on "Submit"
        click_on "Delete post"
        expect(page).not_to have_content("Hello")
    end
end
# post = Post.create(message: "Hello")
# require 'rails_helper'

# RSpec.feature "Sign-up", type: :feature do
#   scenario "Root takes you to the signup page" do
#     visit "/"
#     expect(page).to have_content("Sign-up")
#   end

#   scenario "User can sign up with their name" do
#     visit "/"
#     fill_in "user[name]", with: "Gina"
#     click_on "Sign up"
#     expect(page).to have_content("Welcome Gina!")
#   end
# end