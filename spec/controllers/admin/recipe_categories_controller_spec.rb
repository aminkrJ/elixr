require 'rails_helper'

RSpec.describe Admin::RecipeCategoriesController, type: :controller do
  before(:each) do
    login_with(create(:admin), :admin)
  end

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all recipe_categories as @recipe_categories" do
      recipe_category = RecipeCategory.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:recipe_categories)).to eq([recipe_category])
    end
  end

  describe "GET #show" do
    it "assigns the requested recipe_category as @recipe_category" do
      recipe_category = RecipeCategory.create! valid_attributes
      get :show, {:id => recipe_category.to_param}, valid_session
      expect(assigns(:recipe_category)).to eq(recipe_category)
    end
  end

  describe "GET #new" do
    it "assigns a new recipe_category as @recipe_category" do
      get :new, {}, valid_session
      expect(assigns(:recipe_category)).to be_a_new(RecipeCategory)
    end
  end

  describe "GET #edit" do
    it "assigns the requested recipe_category as @recipe_category" do
      recipe_category = RecipeCategory.create! valid_attributes
      get :edit, {:id => recipe_category.to_param}, valid_session
      expect(assigns(:recipe_category)).to eq(recipe_category)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new RecipeCategory" do
        expect {
          post :create, {:recipe_category => valid_attributes}, valid_session
        }.to change(RecipeCategory, :count).by(1)
      end

      it "assigns a newly created recipe_category as @recipe_category" do
        post :create, {:recipe_category => valid_attributes}, valid_session
        expect(assigns(:recipe_category)).to be_a(RecipeCategory)
        expect(assigns(:recipe_category)).to be_persisted
      end

      it "redirects to the created recipe_category" do
        post :create, {:recipe_category => valid_attributes}, valid_session
        expect(response).to redirect_to(RecipeCategory.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved recipe_category as @recipe_category" do
        post :create, {:recipe_category => invalid_attributes}, valid_session
        expect(assigns(:recipe_category)).to be_a_new(RecipeCategory)
      end

      it "re-renders the 'new' template" do
        post :create, {:recipe_category => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested recipe_category" do
        recipe_category = RecipeCategory.create! valid_attributes
        put :update, {:id => recipe_category.to_param, :recipe_category => new_attributes}, valid_session
        recipe_category.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested recipe_category as @recipe_category" do
        recipe_category = RecipeCategory.create! valid_attributes
        put :update, {:id => recipe_category.to_param, :recipe_category => valid_attributes}, valid_session
        expect(assigns(:recipe_category)).to eq(recipe_category)
      end

      it "redirects to the recipe_category" do
        recipe_category = RecipeCategory.create! valid_attributes
        put :update, {:id => recipe_category.to_param, :recipe_category => valid_attributes}, valid_session
        expect(response).to redirect_to(recipe_category)
      end
    end

    context "with invalid params" do
      it "assigns the recipe_category as @recipe_category" do
        recipe_category = RecipeCategory.create! valid_attributes
        put :update, {:id => recipe_category.to_param, :recipe_category => invalid_attributes}, valid_session
        expect(assigns(:recipe_category)).to eq(recipe_category)
      end

      it "re-renders the 'edit' template" do
        recipe_category = RecipeCategory.create! valid_attributes
        put :update, {:id => recipe_category.to_param, :recipe_category => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested recipe_category" do
      recipe_category = RecipeCategory.create! valid_attributes
      expect {
        delete :destroy, {:id => recipe_category.to_param}, valid_session
      }.to change(RecipeCategory, :count).by(-1)
    end

    it "redirects to the recipe_categories list" do
      recipe_category = RecipeCategory.create! valid_attributes
      delete :destroy, {:id => recipe_category.to_param}, valid_session
      expect(response).to redirect_to(recipe_categories_url)
    end
  end

end
