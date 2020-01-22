require 'rails_helper'

RSpec.feature "User walls", type: :feature do

  let(:user) { create(:user) }

  scenario "User can see their own wall after sign up" do
    sign_up("Example1", "email@example.com", "pass12", "pass12")
    expect(page).to have_content "Account: email@example.com"
  end

  scenario "User can see their own wall after sign in" do
    sign_in("#{user.email}", "hey12345")

    expect(page).to have_current_path("/#{user.id}")
    expect(page).to have_content "Account: #{user.email}"
  end

  scenario "User can see another person's wall" do
    sign_up("Example1", "email@example.com", "pass12", "pass12")
    visit "/#{user.id}"

    expect(page).to have_content "Account: #{user.email}"
  end

  scenario "User is redirected to 404 error page if trying to visit user page that does not exist" do
    sign_in("#{user.email}", "hey12345")
    visit "/#{user.id + 1}"

    expect(page).to have_current_path("/error")
    expect(page).to have_content "The user you were looking for doesn't exist (404)"
  end

  scenario "User is redirected to sign up page if trying to view a user page without logging in" do
    visit "/#{user.id}"

    expect(page).to have_current_path new_user_registration_path
  end

  scenario "Can submit posts on their own user page and view them" do
    sign_up("Example1", "email@example.com", "pass12", "pass12")
    click_button "New post"
    fill_in "Message", with: "Hello, world!"
    post_time = Time.now
    click_button "Submit"

    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Date posted: #{post_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by email@example.com")
  end

  scenario "Can submit posts on another user's page and view them" do
    sign_up("Example1", "email@example.com", "pass12", "pass12")
    visit "/#{user.id}"

    click_button "New post"
    fill_in "Message", with: "Hello, world!"
    post_time = Time.now
    click_button "Submit"

    expect(page).to have_current_path "/#{user.id}"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Date posted: #{post_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by email@example.com")
  end

end
