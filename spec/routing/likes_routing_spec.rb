require "rails_helper"

RSpec.describe LikesController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/posts/1/likes").to route_to("likes#create", :post_id => "1")
    end

    xit "routes to #destroy" do
      expect(:delete => "/likes/1").to route_to("likes#destroy", :id => "1")
    end

    it "routes to #destroy_like_on_post" do
      expect(:post => "posts/1/likes/destroy_like_on_post")
          .to route_to("likes#destroy_like_on_post", :post_id => "1")
    end
  end
end
