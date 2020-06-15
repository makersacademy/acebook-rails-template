# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) { create(:user) }

  describe "GET index" do
    context "after signing in" do
      before { sign_in user }

      it "responds with 200" do
        get :index
        expect(response).to have_http_status(200)
      end
    end
    context "after not signing in" do

      it "responds with 302" do
        get :index
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "GET /new " do
    context "after sign in"
      before { sign_in user }

      it "responds with 200" do
        get :new
        expect(response).to have_http_status(200)
      end
    end
    context "after not signing in" do

      it "responds with 302" do
        get :new
        expect(response).to have_http_status(302)
      end
    end

  describe "POST /" do
    context "signing in" do
      before { sign_in user }

      it "responds with 200" do
        post :create, params: { post: { message: "Hello, world!" } }
        expect(response).to redirect_to(posts_url)
      end

      it "creates a post" do
        post :create, params: { post: { message: "Hello, world!" } }
        expect(Post.find_by(message: "Hello, world!")).to be
      end
    end
  end

    # let(:user) { User.create(email: "testie@test.com", password: "hello42") }
    # let(:user2){ User.create(email: "testie2@test.com", password: "hello43")}
    # let(:post) { Post.create(message: "A new post", user: user)}
    # context "User won't able to" do
    #   it "cannot access a post that isn't theirs" do
    #     sign_in user2
    #     get :edit, params: {id: post.id}
    #     expect(response).not_to render_template :edit
    # end
    # end
end
