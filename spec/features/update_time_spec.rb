# frozen_string_literal: true
# # frozen_string_literal: true

# feature 'time check' do
#   scenario 'a user cannot edit an old post' do
#     sign_up
#     Timecop.freeze(Date.today - 1)
#     create_post
#     Timecop.return
#     click_link 'Edit'
#     fill_in 'post[message]', with: 'edited message'
#     click_button 'Update'
#     expect(page).to have_content('Apologies, you can only update your posts within 10 minutes!')
#     expect(page).not_to have_content('edited message')
#   end
# end
