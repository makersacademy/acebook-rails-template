require 'rails_helper'

RSpec.feature "Like", type: :feature do
  # it "A post starts with 0 likes" do
  #   visit "/posts"
  #   click_link "Add a post"
  #   fill_in "Message", with: "Hello, world!"
  #   click_button "Submit"

  #   expect(page).to have_content('0 Likes')
  # end
  before(:each) do
    u = User.new(username: "practice_user",
             email: "practice@practice.co.uk",
              password: "Password"
            )
    puts "#{u.id}"
  end
  
    it "A post has 1 like" do
      visit "/posts"
      click_link "Add a post"
      fill_in "Message", with: "Hello, world!"
      click_button "Submit"
      click_button "Like"
      expect(response).to have_http_status(302)
      # expect(page).to have_content('0 Likes')  
    end

end



# id | email | encrypted_password | reset_password_token | reset_password_sent_at | remember_created_at | created_at | updated_at | surname | name | 




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