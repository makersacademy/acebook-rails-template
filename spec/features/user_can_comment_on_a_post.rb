require 'rails_helper'

RSpec.feature "Comment", type: :feature do
 scenario "User can comment on a post" do
   sign_up_and_sign_in
   make_a_text_post
   fill_in "Comment", with: 'This is a comment!'
   click_button "Comment"
   expect(page).to have_content('This is a comment!')
 end
end
