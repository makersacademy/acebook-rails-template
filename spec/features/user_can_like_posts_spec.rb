require 'rails_helper'
require_relative '../helpers/features_helper.rb'

# RSpec.feature "Timeline", type: :feature do

#   scenario "Can comment on a post" do
#     sign_up
#     sign_in
#     add_post
#     click_button(class: 'badge badge-secondary')
    
#     find(:xpath, "//a[contains(@href,'/posts/1/likes')]").click
#     Post.all.map { |post|
#     puts post
#     puts post.message
#     puts post.id
#     puts post.get_upvotes.size
#       expect(post.get_upvotes.size).to eq 1
      
#     }
#   end
# end