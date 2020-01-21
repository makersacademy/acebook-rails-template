require 'rails_helper'

RSpec.feature "Delete post", type: :feature do

  let(:user) { create(:user) }

  scenario "Can delete a post if it belongs to the user" do
    sign_in("#{user.email}", "hey12345")
    click_button "New post"
    fill_in "Message", with: "Hello, world!"
    post_time = Time.now
    click_button "Submit"

    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Date posted: #{post_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by #{user.email}")
    expect(page).to have_link('Delete')

    click_link('Delete')

    expect(page).not_to have_content("Hello, world!")
    expect(page).not_to have_content("Date posted: #{post_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).not_to have_content("Posted by email@example.com")
    expect(page).to have_current_path "/#{user.id}"
  end

  scenario "Cannot delete a post if it does not belong to the user" do
    sign_in("#{user.email}", "hey12345")
    click_button "New post"
    fill_in "Message", with: "Hello, world!"
    post_time = Time.now
    click_button "Submit"

    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Date posted: #{post_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by #{user.email}")
    expect(page).to have_link('Delete')

    click_link "Sign out"
    sign_up("test2@example.com", "test1234", "test1234")

    visit "/#{user.id}"

    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Date posted: #{post_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by #{user.email}")
    expect(page).not_to have_link "Delete"
  end
end
