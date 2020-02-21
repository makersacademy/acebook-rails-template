# frozen_string_literal: true
# # frozen_string_literal: true

# feature 'user can like a post (and unlike a post once liked)' do
#   scenario 'from the timeline' do
#     sign_up
#     click_link 'Home'
#     create_post
#     click_button 'Like'
#     click_button 'Unlike'
#     expect(page).to have_content('0 Likes')
#     expect(page).to have_selector(:link_or_button, 'Like')
#   end

#   scenario 'from the user homepage' do
#     sign_up
#     create_post
#     click_button 'Like'
#     click_button 'Unlike'
#     expect(page).to have_content('0 Likes')
#     expect(page).to have_selector(:link_or_button, 'Like')
#   end
# end
