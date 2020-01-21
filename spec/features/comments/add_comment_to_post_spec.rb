require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "Comments should be added to post" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
    new_post('First post')

    new_comment('Test comment')
    within ".comment-message" do
      expect(page).to have_content 'Test comment'
    end

    within ".comment-user" do
      expect(page).to have_content 'Harry Mumford'
    end

    within ".comment-time" do
      expect(page).to have_content Comment.all[0].created_at.strftime('%d %B %Y at %k:%M')
    end
  end

  scenario "shows error if don't fill in comment field" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
    new_post('First post')

    new_comment('')

    expect(page).to have_content "Comment must not be blank."
  end
end
