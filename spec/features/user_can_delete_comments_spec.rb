# require 'rails_helper'
# require 'web_helpers'
# require 'db_helpers'
# require 'rails_helper'

# RSpec.feature "Timeline", type: :feature do

#     scenario "Can submit posts and view them" do
#         sign_up_and_go_to_new_post
#         fill_in "Message", with: "Hello, world!!"
        
#         click_button "Add Comment"
        
#         fill_in
#         post = Comment.find_by(message: "Hello, world!!" )
#         find("#post_#{post.id}").click_link "Delete"
#         # expect(page).to have_css('.header', text: "Your post has been deleted")
        
#         expect(page).not_to have_content("Hello, world!!")
#         expect(find_field('Your name').value).to eq 'Hello world!!'

#     end

# end 