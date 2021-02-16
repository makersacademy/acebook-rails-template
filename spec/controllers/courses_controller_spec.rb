require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  
  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { course: { user_id: 1, title: "Hello, world!" } }
      expect(response).to redirect_to("/courses/2")
    end

    it "creates a course" do
      post :create, params: { course: { user_id: 1, title: "Hello, world!" } }
      expect(Course.find_by(title: "Hello, world!")).to be
    end
  end

  describe "GET /courses/:id" do
    it "responds with 200" do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(200)
    end
  end
end
