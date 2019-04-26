# frozen_string_literal: true
require 'rails_helper'
require 'feature_test_helpers'

RSpec.describe PostsController, type: :controller do

  describe 'Going to page when not logged in redirects to login' do
    it 'redirects to login page' do
      get :new
      expect(response).to redirect_to("/users/sign_in")
    end
  end


  describe "authorisation tests" do

    let(:user) { FactoryBot.create(:user) }

    before do
      sign_in user
    end

    describe "GET /new " do
      it "responds with 200" do
        get :new
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /create" do
      it "responds with 200" do
        post :create, params: { post: { message: "Hello, world!", user_id: 1 } }
        expect(response).to redirect_to(posts_url)
      end

      it "creates a post" do
        post :create, params: { post: { message: "Hello, world!" , user_id: 1 } }
        expect(Post.find_by(message: "Hello, world!")).to be
      end
    end

    ### PARKED FOR NOW WE WILL REVISIT LATER
    # describe "GET /edit" do
    #   it "redirects on error" do
    #     post :create, params: { post: { message: "Hello, world!", user_id: 1, id: 1 } }
    #     get :edit #, params: { post: { message: "Hello, world!", user_id: 1, id: 1 } }
    #     expect(response).to redirect_to(posts_url)
    #   end
    # end

    describe "GET /" do
      it "responds with 200" do
        get :index
        expect(response).to have_http_status(200)
      end
    end
  end
end
