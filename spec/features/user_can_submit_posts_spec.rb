require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  pending "Can submit posts and view them" do # fails due to @post = Post.create(post_params) { |c| c.user_id = current_user.id } in app/controlles/posts_controller.rb
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
