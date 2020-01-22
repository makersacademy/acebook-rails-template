require 'rails_helper'

RSpec.feature "Edit post", type: :feature do

  let(:user) { create(:user) }

  scenario "Can edit a post if it belongs to the user" do
    sign_in("#{user.email}", "hey12345")
    click_button "New post"
    fill_in "Message", with: "Hello, world!"
    post_time = Time.now
    click_button "Submit"

    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Date posted: #{post_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by #{user.email}")
    expect(page).to have_link('Edit')
    expect(page).to have_current_path("/#{user.id}")

    click_link 'Edit'
    fill_in "Message", with: "Goodbye, world!"
    click_button "Update Post"

    expect(page).to have_content("Goodbye, world!")
    expect(page).to have_content("Date posted: #{post_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by #{user.email}")
    expect(page).to have_current_path("/#{user.id}")
  end

  scenario "Cannot edit post if it does not belong to the user" do
    sign_in("#{user.email}", "hey12345")
    click_button "New post"
    fill_in "Message", with: "Hello, world!"
    post_time = Time.now
    click_button "Submit"

    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Date posted: #{post_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by #{user.email}")
    expect(page).to have_link('Edit')

    click_link "Sign out"
    sign_up("Example1", "test2@example.com", "test1234", "test1234")

    visit "/#{user.id}"

    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Date posted: #{post_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by #{user.email}")
    expect(page).not_to have_link "Edit"
  end
end
