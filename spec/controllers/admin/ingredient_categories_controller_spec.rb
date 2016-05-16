require 'rails_helper'

RSpec.describe Admin::IngredientCategoriesController, type: :controller do
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
    it "assigns all ingredient_categories as @admin_ingredient_categories" do
      ingredient_category = IngredientCategory.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:ingredient_categories)).to eq([ingredient_category])
    end
  end

  describe "GET #show" do
    it "assigns the requested ingredient_category as @ingredient_category" do
      ingredient_category = IngredientCategory.create! valid_attributes
      get :show, {:id => ingredient_category.to_param}, valid_session
      expect(assigns(:ingredient_category)).to eq(ingredient_category)
    end
  end

  describe "GET #new" do
    it "assigns a new ingredient_category as @ingredient_category" do
      get :new, {}, valid_session
      expect(assigns(:ingredient_category)).to be_a_new(IngredientCategory)
    end
  end

  describe "GET #edit" do
    it "assigns the requested ingredient_category as @ingredient_category" do
      ingredient_category = IngredientCategory.create! valid_attributes
      get :edit, {:id => ingredient_category.to_param}, valid_session
      expect(assigns(:ingredient_category)).to eq(ingredient_category)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new IngredientCategory" do
        expect {
          post :create, {:ingredient_category => valid_attributes}, valid_session
        }.to change(IngredientCategory, :count).by(1)
      end

      it "assigns a newly created ingredient_category as @ingredient_category" do
        post :create, {:ingredient_category => valid_attributes}, valid_session
        expect(assigns(:ingredient_category)).to be_a(IngredientCategory)
        expect(assigns(:ingredient_category)).to be_persisted
      end

      it "redirects to the created ingredient_category" do
        post :create, {:ingredient_category => valid_attributes}, valid_session
        expect(response).to redirect_to(IngredientCategory.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved ingredient_category as @ingredient_category" do
        post :create, {:ingredient_category => invalid_attributes}, valid_session
        expect(assigns(:ingredient_category)).to be_a_new(IngredientCategory)
      end

      it "re-renders the 'new' template" do
        post :create, {:ingredient_category => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested ingredient_category" do
        ingredient_category = IngredientCategory.create! valid_attributes
        put :update, {:id => ingredient_category.to_param, :ingredient_category => new_attributes}, valid_session
        ingredient_category.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested ingredient_category as @ingredient_category" do
        ingredient_category = IngredientCategory.create! valid_attributes
        put :update, {:id => ingredient_category.to_param, :ingredient_category => valid_attributes}, valid_session
        expect(assigns(:ingredient_category)).to eq(ingredient_category)
      end

      it "redirects to the ingredient_category" do
        ingredient_category = IngredientCategory.create! valid_attributes
        put :update, {:id => ingredient_category.to_param, :ingredient_category => valid_attributes}, valid_session
        expect(response).to redirect_to(ingredient_category)
      end
    end

    context "with invalid params" do
      it "assigns the ingredient_category as @ingredient_category" do
        ingredient_category = IngredientCategory.create! valid_attributes
        put :update, {:id => ingredient_category.to_param, :ingredient_category => invalid_attributes}, valid_session
        expect(assigns(:ingredient_category)).to eq(ingredient_category)
      end

      it "re-renders the 'edit' template" do
        ingredient_category = IngredientCategory.create! valid_attributes
        put :update, {:id => ingredient_category.to_param, :ingredient_category => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested ingredient_category" do
      ingredient_category = IngredientCategory.create! valid_attributes
      expect {
        delete :destroy, {:id => ingredient_category.to_param}, valid_session
      }.to change(IngredientCategory, :count).by(-1)
    end

    it "redirects to the admin_ingredient_categories list" do
      ingredient_category = IngredientCategory.create! valid_attributes
      delete :destroy, {:id => ingredient_category.to_param}, valid_session
      expect(response).to redirect_to(admin_ingredient_categories_url)
    end
  end

end
