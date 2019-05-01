# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Editing posts", type: :feature do
  scenario "An 'edit' link should appear on a user's post" do
    sign_up
    create_post
    expect(page).to have_link("Edit")
  end

  scenario "An 'edit' link should not appear on a different user's post" do
    sign_up username: "user1", email: "user1@gmail.com"
    create_post
    sign_up username: "user2", email: "user2@gmail.com"
    visit "/posts"
    expect(page).not_to have_link("Edit")
  end

  scenario "The edit link should go to the edit page for the post" do
    sign_up
    create_post
    click_link "Edit"
    expect(page).to have_content("Edit post")
  end

  scenario "Users can edit posts from the edit post page" do
    sign_up
    create_post message: "My first post"
    click_link "Edit"
    fill_in "Message", with: "My edited post"
    click_on "Submit"
    expect(page).not_to have_content("My first post")
    expect(page).to have_content("My edited post")
  end

  scenario "Users can't edit other users' posts" do
    # not very feature testy!
    # maybe this should be a unit test on the route???
    user1 = User.create(username: "user1",
                        email: "user1@gmail.com",
                        password: "123456")
    post = Post.create(message: "my message", author_id: user1.id)

    sign_up username: "user2", email: "user2@gmail.com"
    visit "/posts/#{post.id}/edit"
    expect(page).to have_content "You can't edit that post!"
  end

  context "Presence of the edit link depends on the post's age" do
    scenario "The edit link doesn't appear if a post is 10 minutes old" do
      sign_up
      create_post
      Timecop.freeze(601)
      visit "/posts"
      expect(page).not_to have_link("Edit")
    end

    scenario "The edit link does appear if it's less than 10 minutes old" do
      sign_up
      create_post
      Timecop.freeze(599)
      visit "/posts"
      expect(page).to have_link("Edit")
    end
  end

  context "Editability depends on the post's age" do
    context "Post can't be edited after 10 minutes" do
      before do
        sign_up
        create_post message: "My message"
        click_link "Edit"
        fill_in "Message", with: "My edited post"
        Timecop.freeze(601)
        click_button "Submit"
      end

      scenario "Displays an error message if you edit after 10 minutes" do
        expect(page).to have_content("Could not edit post.")
      end

      scenario "Message not edited if you edit after 10 minutes" do
        expect(page).not_to have_content("My edited post")
      end
    end

    context "Post can be edited for up to 10 minutes" do
      before do
        sign_up
        create_post message: "My message"
        click_link "Edit"
        fill_in "Message", with: "My edited post"
        Timecop.freeze(599)
        click_button "Submit"
      end

      scenario "Does not display an error message if you edit after 10 minutes" do
        expect(page).not_to have_content("Could not edit post.")
      end

      scenario "Message edited if you edit after 10 minutes" do
        expect(page).to have_content("My edited post")
      end
    end
  end
end
