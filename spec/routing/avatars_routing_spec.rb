require "rails_helper"

RSpec.describe AvatarsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/avatars").to route_to("avatars#index")
    end

    it "routes to #new" do
      expect(:get => "/avatars/new").to route_to("avatars#new")
    end

    it "routes to #show" do
      expect(:get => "/avatars/1").to route_to("avatars#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/avatars/1/edit").to route_to("avatars#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/avatars").to route_to("avatars#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/avatars/1").to route_to("avatars#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/avatars/1").to route_to("avatars#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/avatars/1").to route_to("avatars#destroy", :id => "1")
    end

  end
end
