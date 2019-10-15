require "rails_helper"

RSpec.describe ProfilePicturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/profile_pictures").to route_to("profile_pictures#index")
    end

    it "routes to #new" do
      expect(:get => "/profile_pictures/new").to route_to("profile_pictures#new")
    end

    it "routes to #show" do
      expect(:get => "/profile_pictures/1").to route_to("profile_pictures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/profile_pictures/1/edit").to route_to("profile_pictures#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/profile_pictures").to route_to("profile_pictures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/profile_pictures/1").to route_to("profile_pictures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/profile_pictures/1").to route_to("profile_pictures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/profile_pictures/1").to route_to("profile_pictures#destroy", :id => "1")
    end
  end
end
