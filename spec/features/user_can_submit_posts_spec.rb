require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(find_field('post_message').value).to eq 'Hello, world!'
  end

  scenario "Can submit posts and view them" do
    signup("test@test.com", "123456")
    click_link "New post"
    fill_in "Message", with: "user 1 post"
    click_button "Submit"
    expect(find_field('post_message').value).to eq 'user 1 post'
    signup("test2@test.com", "1234567")
    click_link "New post"
    fill_in "Message", with: "user 2 post"
    click_button "Submit"
    expect(find_field('post_message').value).to eq 'user 2 post'
    expect(find_field('post_message').value).not_to eq 'user 1 post'
  end
end
