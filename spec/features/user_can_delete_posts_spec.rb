require 'rails_helper'

RSpec.feature "Delete post", type: :feature do 
    scenario "user can delete a post" do
        post = Post.create!(message: "Hello")
        visit "/posts"
        click_on "Delete post"
        expect(page).not_to have_content("Hello")
    end
end

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