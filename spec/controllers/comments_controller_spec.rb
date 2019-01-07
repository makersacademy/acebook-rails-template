require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:user) { FactoryBot.create(:user) }

  before :each do
    login_as(user, scope: :user)
  end

  describe "GET #index " do
    it "responds with 200" do
      post = FactoryBot.create(:post)
      get :create, params: { post_id: 1, comment: "A comment" }
      expect(response).to have_http_status(200)
    end
  end

end
