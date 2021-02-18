require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /" do
    it "responds with 200" do
      get :index, params: { course_id: 1 }
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /new " do
    it "responds with 200" do
      get :new, params: { course_id: 1 }
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { course_id: 1, post: { content: "Hello, world!" } }
      expect(response).to redirect_to("/courses/1/posts")
    end

    it "creates a post" do
      post :create, params: { course_id: 1, post: { content: "Hello, world!" } }
      expect(Post.find_by(content: "Hello, world!")).to be
    end
  end

  describe "GET courses/:course_id/posts/:id" do
    it "responds with 200" do
      get :show, params: { course_id: 1, id: 1}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET courses/:course_id/posts/:id/edit" do
    it "responds with 200" do
      get :edit, params: {course_id: 1, id: 1}
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH/PUT courses/:course_id/posts/:id " do
    it "redirects back" do
      put :update, params: {course_id: 1, id: 1, post: { content: "changing test content"} }
      expect(response).to redirect_to("/")
    end

    it "edits a post" do
      put :update, params: {course_id: 1, id: 1, post: { content: "changing test content"} }
      expect(Post.find_by(content: "Hello World")).not_to be
      expect(Post.find_by(content: "changing test content")).to be
    end
  end

end
