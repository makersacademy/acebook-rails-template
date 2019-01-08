require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  let(:test_post) { FactoryBot.create(:post) }
  let(:user) { FactoryBot.create(:user) }

  describe "POST #create " do
    it "responds with 302 if post created" do
      allow(controller).to receive(:current_user).and_return(user)
      post :create, params: { post_id: test_post.id }
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE #destroy " do

    let!(:like) { FactoryBot.create(:like) }

    it "responds with 302 if post deleted" do
      allow(controller).to receive(:current_user).and_return(user)
      delete :destroy, params: { post_id: like.post.id, id: like.id }
      expect(response).to have_http_status(302)
    end
  end

end
