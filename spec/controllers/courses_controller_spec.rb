require 'rails_helper'

RSpec.describe "/courses", type: :request do
  describe "GET /" do
    it "responds with 200" do
      get courses_url
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /new " do
    it "responds with 200" do
      get new_course_url
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /courses/:id" do
    it "responds with 200" do
      get course_url(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET courses/:id/edit" do
    it "responds with 200" do
      get edit_course_url(1)
      expect(response).to have_http_status(200)
    end
  end

end

RSpec.describe CoursesController, type: :controller do
  
  describe "POST /" do
    it "responds with 200" do
      post :create, params: { course: { user_id: 1, title: "Hello, world!" } }
      expect(response).to redirect_to("/courses/3")
    end

    it "creates a course" do
      post :create, params: { course: { user_id: 1, title: "Hello, world!" } }
      expect(Course.find_by(title: "Hello, world!")).to be
    end
  end

  describe "PATCH/PUT courses/:id" do
    it "redirects back" do
      put :update, params: {id: 1, course: { title: "Changing Test Title" } }
      expect(response).to redirect_to("/courses/1")
    end

    it "edits a course" do
      put :update, params: {id: 1, course: { title: "Changing Test Title" } }
      expect(Course.find_by(title: "Test Course")).not_to be
      expect(Course.find_by(title: "Changing Test Title")).to be
    end
  end

  describe "DELETE courses/:id" do
    it "redirects back" do
      delete :destroy, params: { id: 1 }
      expect(response).to redirect_to("/")
    end

    it "deletes a course" do
      delete :destroy, params: { id: 1 }
      expect(Course.find_by(title: "Test Course")).not_to be
    end
  end

end
