require 'rails_helper'

RSpec.feature "Like", type: :feature do
  scenario "A post starts with 0 likes" do
    visit "/posts"
    click_link "Add a post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    # Post.create.count
    click_button "Like"
    # expect(Post.create.count).to be(1)
  end
end

# @post.likes.create(user_id: current_user.id)
#    redirect_to posts_url


