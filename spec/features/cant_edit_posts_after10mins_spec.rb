# require 'rails_helper'

# RSpec.feature 'Edit Post', type: :feature do
#   scenario 'Cannot edit a post after 10mins' do
#     create_message
#     post = Post.all[0]
#     post.created_at += 601
#     click_link 'Edit'
#     expect(page).to have_content('You can only edit posts 10 minutes after it has been created')
#   end
# end