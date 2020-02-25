require "rails_helper"

RSpec.describe IdeasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ideas").to route_to("ideas#index")
    end

    it "routes to #new" do
      expect(:get => "/ideas/new").to route_to("ideas#new")
    end

    it "routes to #show" do
      expect(:get => "/ideas/1").to route_to("ideas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ideas/1/edit").to route_to("ideas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ideas").to route_to("ideas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ideas/1").to route_to("ideas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ideas/1").to route_to("ideas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ideas/1").to route_to("ideas#destroy", :id => "1")
    end

  end
end
