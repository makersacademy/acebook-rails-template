require 'rails_helper'

feature "Clicks Username link" do 
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id) }
  scenario "clicks username on post index page and is directed to that users page" do 
    user
    post
    sign_up 
    click_link("AceBook")
    click_link("BigUser1")
    expect(page).to have_content(user.username)
  end 
end
