# require 'rails_helper'
# require 'date'
#
# describe "A post" do
#   let!(:wall_owner) { User.create(email: 'owner@example.com', password: 'testtest') }
#
#   it "Can show date" do
#     Post.create(message: 'Hello, world!', user_id: @user.id, wall_id: wall_owner.id, created_at: DateTime.new(2021, 1, 3, 1, 3, 3))
#     visit "/#{wall_owner.id}"
#     expect(page).to have_content('3 Jan 2021')
#   end
#
# end
#
#
#
#
# fill_in "post[message]", with: "Hello, world!"
# #     click_button "Post"
# #     expect(page).to have_content("Hello, world!")
# #     date = DateTime.now.strftime('%d %b %Y')
# #     expect(page).to have_content(date)
# #   end
