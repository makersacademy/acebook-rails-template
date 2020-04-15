require "rails_helper"

RSpec.describe TimelinePostsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/timeline_posts").to route_to("timeline_posts#index")
    end

    it "routes to #new" do
      expect(:get => "/timeline_posts/new").to route_to("timeline_posts#new")
    end

    it "routes to #show" do
      expect(:get => "/timeline_posts/1").to route_to("timeline_posts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/timeline_posts/1/edit").to route_to("timeline_posts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/timeline_posts").to route_to("timeline_posts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/timeline_posts/1").to route_to("timeline_posts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/timeline_posts/1").to route_to("timeline_posts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/timeline_posts/1").to route_to("timeline_posts#destroy", :id => "1")
    end

  end
end
