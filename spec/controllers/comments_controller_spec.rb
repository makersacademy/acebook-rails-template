require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  # describe "GET #index " do
  #   it "responds with 200" do
  #     get :index
  #     expect(response).to have_http_status(200)
  #   end
  # end

  # describe "POST /" do
  #   let(:user) {User.create!(username: "yo man", password: "1234567")}
  #
  #   it "responds with 200" do
  #     session[:user_id] = user.id
  #     post :create, params: { post: { message: "Hello, world!" } }
  #     comment :create, params: { comment: { content: "Hello, world!" } }
  #     expect(response).to redirect_to(posts_url)
  #
  #   end
  #
  #   it "creates a post" do
  #     session[:user_id] = user.id
  #     post :create, params: { post: { message: "Hello, world!" } }
  #     comment :create, params: { comment: { content: "Hello, world!" } }
  #     expect(Comment.find_by(content: "Hello, world!")).to be
  #   end
  # end
end
