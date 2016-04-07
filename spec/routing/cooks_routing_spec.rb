require "rails_helper"

RSpec.describe CooksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cooks").to route_to("cooks#index")
    end

    it "routes to #new" do
      expect(:get => "/cooks/new").to route_to("cooks#new")
    end

    it "routes to #show" do
      expect(:get => "/cooks/1").to route_to("cooks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cooks/1/edit").to route_to("cooks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cooks").to route_to("cooks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cooks/1").to route_to("cooks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cooks/1").to route_to("cooks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cooks/1").to route_to("cooks#destroy", :id => "1")
    end

  end
end
