require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  def sign_up
    visit '/users/new'
    fill_in 'user_name', with: 'TestName'
    fill_in 'user_email', with: 'testemail@test.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'
    click_button 'Create my account'
  end
  
  scenario "Can submit posts and view them" do
    sign_up
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Create new post"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can submit a post and like it, and see increased number of likes" do
    sign_up
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Create new post"
    click_link("Like", match: :first)
    expect(page).to have_content("1 like")
    click_link("Like", match: :first)
    expect(page).to have_content("2 likes")
  end

  scenario "Can edit posts" do
    sign_up
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Create new post"
    click_link("Edit", match: :first)
    fill_in "Message", with: "Hello, Earth!"
    click_button "Create new post"
    expect(page).to have_content("Hello, Earth!")
  end

  scenario "Can delete posts" do
    sign_up
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Create new post"
    click_button("Delete")
    expect(page).not_to have_content("Hello, world!")
  end

  xscenario " Can add comment" do
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Create new post"
    click_button "Comment"
    fill_in "Comment message", with: "Hello, comment!"
    click_link "Submit"
    expect(page).to have_content("Hello, comment!")
  end

end
