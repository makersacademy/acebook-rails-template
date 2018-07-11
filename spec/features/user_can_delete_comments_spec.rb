require 'rails_helper'

RSpec.feature "User can delete their own comment", type: :feature do
  scenario 'successfully' do
    sign_up_successfully
    submit_post_successfully

    fill_in 'comment_content', with: 'This is a text comment on the post'
    click_button "Comment"

    click_button "Delete"
    expect(page).not_to have_content("This is a text comment on the post")
  end
end

# RSpec.feature "User cannot like post twice", type: :feature do
#   scenario 'successfully' do
#     sign_up_successfully
#
#     fill_in "post_message", with: "test text"
#     click_button 'Post'
#     click_button 'Like'
#     click_button 'Like'
#
#     expect(page).to have_content("Likes: 1")
#     expect(page).not_to have_content("Likes: 2")
#   end
# end
