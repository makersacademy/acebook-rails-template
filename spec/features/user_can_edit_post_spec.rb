require 'rails_helper'
require 'features_helper'

RSpec.feature "Edit ", type: :feature do
  scenario "Can edit own post and view the updated post" do
    signup
    login
    create_post
    click_link "Edit"
    fill_in "post[message]", with: "Hello, world"
    click_button "Update Post"
    expect(page).to have_content("Hello, world")
  end

  # scenario "Cannot edit own post after 10 minutes" do
  #   signup
  #   login
  #   create_post
  #   @post = Post.find(current_url.to_s.split("/")[-1].to_i)
  #   @post.created_at = 11.minutes.ago
  #   @post.save
  #   expect(page).not_to have_link("Edit")
  # end

end
