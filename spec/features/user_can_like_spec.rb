require 'rails_helper'

RSpec.feature "Like", type: :feature do
  scenario "A post starts with 0 likes" do
    visit "/posts"
    click_link "Add a post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    expect(page).to have_content('0 Likes')
  end

end




# subject {
#   described_class.new(title: "Anything",
#                       description: "Lorem ipsum",
#                       start_date: DateTime.now,
#                       end_date: DateTime.now + 1.week)
# }


# @post.likes.create(user_id: current_user.id)
#    redirect_to posts_url


# scenario "A post starts with 0 likes" do
#   visit "/posts"
#   click_link "Add a post"
#   fill_in "Message", with: "Hello, world!"
#   click_button "Submit"

#   # Post.create.count
#   # click_button "Like"
#   # expect(Post.create.count).to be(1)
#   expect(page).to have_content('0 Likes')
#   # (expect{ click_button "Like" }.to change { post.likes }.by(1))
# end