require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can create and delete a single post" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "First Post"
    click_button "Submit"
    expect(find_field('post_message').value).to eq 'First Post'
    click_button "Delete"
    expect{page.find_by_id('post_message')}.to raise_error 
  end
end
