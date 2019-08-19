# require 'rails_helper'
#
# feature "User can sign up" do
#   scenario 'A user wants to create and account to use AceBook' do
#     signup
#     expect(page).to have_xpath('./users//p[@id="1"]')
#   end
# end

# describe "User can sign up" do
#   let(:user) {User.create!(username: "yo man", password: "1234567")}
#
#   it "responds with 200" do
#     session[:user_id] = user.id
#     post :create, params: { post: { message: "Hello, world!" } }
#     expect(response).to redirect_to(posts_url)
#   end
# end
