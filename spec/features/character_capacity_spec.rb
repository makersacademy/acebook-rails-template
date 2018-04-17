require 'rails_helper'

RSpec.feature "Character capacity", type: :feature do

  before(:each) do
    sign_up
    @long_post = "somethings"*100
    @shortened_post = "somethings"*50
    @long_comment = "somethings"*100
    @shortened_comment = "somethings"*14
  end

  scenario "Only allows 500 characters" do
    click_link "New post"
    fill_in "Message", with: @long_post
    click_button "Submit"
    expect(page).to have_css("div#post_message_0", text: @shortened_post)
  end

  scenario "Can like post and view immediately" do
    add_post
    click_link "View Comments"
    fill_in "comment[content]", with: @long_comment
    click_button "Create Comment"
    expect(page).to have_css("div#comment_0", text: @shortened_comment)
  end

end
