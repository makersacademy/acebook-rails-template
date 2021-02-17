require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { course_id: 1, subscription: { user_id: 1 } }
      expect(response).to redirect_to("/")
    end

    it "creates a subscription" do
      post :create, params: { course_id: 1, subscription: { user_id: 1 } }
      expect(Subscription.find_by(course_id: 1, user_id: 1)).to be
    end
  end

  describe "DELETE /" do
    it "responds with 200" do
      delete :destroy, params: { course_id: 1, id: 1}
      expect(response).to redirect_to("/")
    end

    it "deletes a subscription" do
      delete :destroy, params: { course_id: 1, id: 1}
      expect(Subscription.find_by(course_id: 1, user_id: 1)).not_to be
    end
  end
end
