require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'it renders a new comment form' do
    it 'GET /' do
      user = create(:user)
      sign_in user
      post = create(:post)
      get :new, params: { post_id: post.id }
      expect(subject).to render_template('new')
    end
  end
  # describe "it renders an edit comment form" do
  #   it "GET /" do
  #     user = create(:user)
  #     sign_in user
  #     post = create(:post)
  #     comment = create(:comment)
  #     get :edit, params: { post_id: post.id, id: comment.id }
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
