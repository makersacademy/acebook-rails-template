require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "Comments should be added to post" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
    new_post('First post')

    fill_in 'Message', with: 'Test comment'
    click_on "Comment"
    within ".comment" do
      expect(page).to have_content 'Test comment'
      expect(page).to have_content 'Harry Mumford'
      expect(page).to have_content Comment.all[0].created_at.strftime('%d %B %Y at %k:%M')
    end
  end

end
