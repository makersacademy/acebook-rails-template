require "rails_helper"

RSpec.describe CommentLikesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/comment_likes").to route_to("comment_likes#index")
    end

    it "routes to #new" do
      expect(get: "/comment_likes/new").to route_to("comment_likes#new")
    end

    it "routes to #show" do
      expect(get: "/comment_likes/1").to route_to("comment_likes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/comment_likes/1/edit").to route_to("comment_likes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/comment_likes").to route_to("comment_likes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/comment_likes/1").to route_to("comment_likes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/comment_likes/1").to route_to("comment_likes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/comment_likes/1").to route_to("comment_likes#destroy", id: "1")
    end
  end
end
