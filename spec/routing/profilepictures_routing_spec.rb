require "rails_helper"

RSpec.describe ProfilepicturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/profilepictures").to route_to("profilepictures#index")
    end

    it "routes to #new" do
      expect(:get => "/profilepictures/new").to route_to("profilepictures#new")
    end

    it "routes to #show" do
      expect(:get => "/profilepictures/1").to route_to("profilepictures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/profilepictures/1/edit").to route_to("profilepictures#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/profilepictures").to route_to("profilepictures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/profilepictures/1").to route_to("profilepictures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/profilepictures/1").to route_to("profilepictures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/profilepictures/1").to route_to("profilepictures#destroy", :id => "1")
    end
  end
end
