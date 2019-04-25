require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST /" do
    it "redirects" do
      post :create, params: { user: { email: "beefboi@beefy.com.org.uk", password: "BEEF" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a user" do
      post :create, params: { user: { email: "beefy@iamalegend.com", password: "suckurnan" } }
      expect(User.find_by(email: "beefy@iamalegend.com")).to be
    end

    it "prevents data entry when invalid email entered" do
      post :create, params: { user: { email: "beefy", password: "suckurnan" } }
      User.find_by(email:"beefy")
      expect(User.find_by(email:"beefy")).to eq(nil)
    end

  end
end
