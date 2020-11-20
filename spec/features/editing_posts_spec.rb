require 'rails_helper'

RSpec.feature "Editing posts", type: :feature do

  before do
    user_signup('arakno', 'arakno@makers.com', 'Arabella Knowles', 'makers4L')
  end

  context 'Post is created before tests' do
    
    before do
      create_post("Hello, world!")
    end

    scenario "User can edit posts and see result on /posts" do
      post_id = Post.find_by(message: "Hello, world!").id
      within("div#post-#{post_id}") do
        click_link "edit"
      end
      fill_in "Message", with: "New message"
      click_button "Submit"
      expect(page).to have_content("New message")
    end

    scenario "User cannot see edit button on someone else's post" do
      click_link "Logout"
      user_signup('ds.danielh', 'dan@makers.com', 'Dan Makers', 'password')
      expect(page).not_to have_link("edit")
    end

    scenario "User receives an error message if they try to edit someone else's post" do
      click_link "Logout"
      user_signup('ds.danielh', 'dan@makers.com', 'Dan Makers', 'password')
      post_id = Post.find_by(message: "Hello, world!").id
      visit "/posts/#{post_id}/edit"
      fill_in "Message", with: "New message"
      click_button "Submit"
      expect(page).to have_content("Error: You can only edit your own posts.")
      expect(page).to_not have_content('New message')
    end
  end

  scenario "User can't see edit button 10 minutes after creating post" do
    user = User.find_by_email('arakno@makers.com')
    Post.create(id: 1, message: 'Ten minutes ago', created_at: DateTime.now - 10.minutes, user_id: user.id )
    visit "/posts"
    expect(page).to_not have_link('edit')
  end

  scenario "User gets a flash message if they try to update the post when it's more than 10 minutes old" do
    user = User.find_by_email('arakno@makers.com')
    Post.create(id: 1, message: 'Ten minutes ago', created_at: DateTime.now - 10.minutes, user_id: user.id )
    visit "/posts/1/edit"
    fill_in "Message", with: "this is too old to edit"
    click_button "Submit"
    expect(page).to have_content("Error: You can only update posts when they are less than 10 minutes old")
    expect(page).to_not have_content('this is too old to edit')
  end

end