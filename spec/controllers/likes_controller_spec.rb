require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:test_post) { FactoryBot.create(:post) }
  let(:user) { FactoryBot.create(:user) }

  describe "POST #create " do
    def create_like
      allow(controller).to receive(:current_user).and_return(user)
      post :create, params: { post_id: test_post.id }
    end

    it "responds with 302 if post created" do
      create_like
      expect(response).to have_http_status(302)
    end

    it "adds a like to the db" do
      expect { create_like }.to change { Like.count }.by(1)
    end
  end

  describe "DELETE #destroy " do
    let!(:like) { FactoryBot.create(:like) }

    def delete_like
      allow(controller).to receive(:current_user).and_return(user)
      delete :destroy, params: { post_id: like.post.id, id: like.id }
    end

    it "responds with 302 if post deleted" do
      delete_like
      expect(response).to have_http_status(302)
    end
  end
end
