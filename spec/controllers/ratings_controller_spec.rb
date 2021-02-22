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

end