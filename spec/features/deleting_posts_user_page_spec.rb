# frozen_string_literal: true
# # frozen_string_literal: true

# feature 'user can delete posts' do
#   scenario 'from the user homepage' do
#     sign_up
#     create_post
#     click_link 'Delete'
#     expect(page).not_to have_content('test message')
#   end

#   scenario 'from the homepage, comments will also be destroyed' do
#     sign_up
#     create_post
#     create_comment
#     click_link 'Delete'
#     expect(page).not_to have_content('test message')
#     expect(page).not_to have_content('test comment')
#   end

#   scenario 'and they will delete from the timeline' do
#     sign_up
#     create_post
#     click_link 'Delete'
#     click_link 'Home'
#     expect(page).not_to have_content('test message')
#   end
# end
