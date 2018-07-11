require 'rails_helper'

RSpec.feature "User can make a comment", type: :feature do
  scenario "on their own post" do
    sign_up_successfully
    
    fill_in "post_message", with: "test text"
    click_button 'Post'

    fill_in 'comment_content', with: 'This is a text comment on the post'
    click_button "Comment"

    expect(page).to have_content("This is a text comment on the post")
  end

  xscenario "on anothers post" do

  end


end
