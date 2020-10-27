# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
    @new_post = FactoryBot.create(:post, :new)
    sign_in(@user)
  end

  describe 'POST /create' do
    it 'Likes a post' do
      post :create, params: { post_id: @new_post.id, user_id: @user.id }
      expect(response).to have_http_status(302)
    end

    it 'Unlikes the post' do
      new_like = FactoryBot.create(:like)
      post :create, params: { post_id: @new_post.id, user_id: @user.id }
      expect(response).to have_http_status(302)
    end
  end
end
