require "rails_helper"

RSpec.describe Admin::IngredientCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/ingredient_categories").to route_to("admin/ingredient_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/ingredient_categories/new").to route_to("admin/ingredient_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/ingredient_categories/1").to route_to("admin/ingredient_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/ingredient_categories/1/edit").to route_to("admin/ingredient_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/ingredient_categories").to route_to("admin/ingredient_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/ingredient_categories/1").to route_to("admin/ingredient_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/ingredient_categories/1").to route_to("admin/ingredient_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/ingredient_categories/1").to route_to("admin/ingredient_categories#destroy", :id => "1")
    end

  end
end
