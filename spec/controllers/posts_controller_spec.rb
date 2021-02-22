require 'rails_helper'

RSpec.describe "/courses/:course_id/posts", type: :request do
  describe "GET /new " do
    it "responds with 200" do
      get new_course_post_url(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET courses/:course_id/posts/:id" do
    it "responds with 200" do
      get course_post_url(1,1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET courses/:course_id/posts/:id/edit" do
    it "responds with 200" do
      get edit_course_post_url(1,1)
      expect(response).to have_http_status(200)
    end
  end
  
end

RSpec.describe PostsController, type: :controller do

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { course_id: 1, post: { title: "New Post", content: "Hello, world!" } }
      expect(response).to redirect_to("/courses/1/posts")
    end

    it "creates a post" do
      post :create, params: { course_id: 1, post: { title: "New Post", content: "Hello, world!" } }
      expect(Post.find_by(title: "New Post")).to be
    end
  end

  describe "PATCH/PUT courses/:course_id/posts/:id" do
    it "redirects back" do
      put :update, params: {course_id: 1, id: 1, post: { title: "changing test title"} }
      expect(response).to redirect_to("/courses/1/posts/1")
    end

    it "edits a post" do
      put :update, params: {course_id: 1, id: 1, post: { title: "changing test title"} }
      expect(Post.find_by(title: "Test Post")).not_to be
      expect(Post.find_by(title: "changing test title")).to be
    end
  end

  describe "DELETE courses/:course_id/posts/:id" do
    it "redirects back" do
      put :destroy, params: { course_id: 1, id: 1 }
      expect(response).to redirect_to("/courses/1/posts")
    end

    it "edits a post" do
      put :destroy, params: { course_id: 1, id: 1 }
      expect(Post.find_by(content: "Hello World")).not_to be
    end
  end

end
