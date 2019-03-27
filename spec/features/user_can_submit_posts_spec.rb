require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")

  end
  scenario "Can see the newest post first" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "First"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Second"
    click_button "Submit"
    first = page.first(".msg").text
    expect(first).to have_content("Second")
  end

  scenario "Can see the post with date and time" do
    post1 = Post.create(message: "Hello")
    time = post1[:created_at].strftime("%B %d %Y, %l:%M%P")
    # time = timeFrame.strftime("%B %d %Y, %l:%M%P")
    visit "/posts"
    first1 = page.first(".msg").text
    expect(first1).to have_content("#{time}")


  end
end
