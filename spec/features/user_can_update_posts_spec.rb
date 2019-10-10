require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can create and update a single post" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "First Post"
    click_button "Submit"
    expect(find_field('post_message').value).to eq 'First Post'
    fill_in "post[message]", with: "Updated First Post"
    click_button "Save"
    expect(find_field('post_message').value).to eq 'Updated First Post'
  end
end
