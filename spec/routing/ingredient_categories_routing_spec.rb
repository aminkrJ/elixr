require "rails_helper"

RSpec.describe IngredientCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/recipe_categories").to route_to("recipe_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/recipe_categories/new").to route_to("recipe_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/recipe_categories/1").to route_to("recipe_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/recipe_categories/1/edit").to route_to("recipe_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/recipe_categories").to route_to("recipe_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/recipe_categories/1").to route_to("recipe_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/recipe_categories/1").to route_to("recipe_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/recipe_categories/1").to route_to("recipe_categories#destroy", :id => "1")
    end

  end
end
