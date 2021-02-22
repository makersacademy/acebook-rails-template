require 'rails_helper'

RSpec.describe RatingsController, type: :controller do
 
  describe "POST /" do
    it "responds with 200" do
      post :create, params: { course_id: 1, rating: { value: 1 } }
      expect(response).to redirect_to("/")
    end

    it "creates a rating" do
      post :create, params: { course_id: 1, rating: { value: 1 } }
      expect(Rating.find_by(value: 1)).to be
    end
  end

  describe "PATCH/PUT courses/:course_id/posts/:id" do
    it "redirects back" do
      put :update, params: { course_id: 1, id: 1, rating: { value: 2 } }
      expect(response).to redirect_to("/")
    end

    it "edits a post" do
      put :update, params: { course_id: 1, id: 1, rating: { value: 2 } }
      expect(Rating.find_by(value: 5)).not_to be
      expect(Rating.find_by(value: 2)).to be
    end
  end

end